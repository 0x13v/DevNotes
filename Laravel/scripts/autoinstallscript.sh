#!/bin/bash

#declare auto functions ["key text"]="function name"
declare -A auto_functions
auto_functions=(
    ["Install Dependencies"]="installdependencies"
    [".env file"]="environmentfiles"
    ["Application key generate"]="application_key_generate"
    ["Database migrations"]="database_migrations"
    ["Exit"]="Exiting"

)

#exit function
function Exiting() {
    echo "Exiting..."
    exit 0
}

#logo function
function drawTitellogo() {
    clear
    echo -e ''
    echo -e ''
    echo -e ''
    echo -e '  ___        _          _                               _   _           _        _ _           '
    echo -e ' / _ \      | |        | |                             | | (_)         | |      | | |          '
    echo -e '/ /_\ \_   _| |_ ___   | |     __ _ _ __ __ ___   _____| |  _ _ __  ___| |_ __ _| | | ___ _ __ '
    echo -e '|  _  | | | | __/ _ \  | |    / _  |  __/ _  \ \ / / _ \ | | |  _ \/ __| __/ _  | | |/ _ \  __|'
    echo -e '| | | | |_| | || (_) | | |___| (_| | | | (_| |\ V /  __/ | | | | | \__ \ || (_| | | |  __/ |   '
    echo -e '\_| |_/\__,_|\__\___/  \_____/\__,_|_|  \__,_| \_/ \___|_| |_|_| |_|___/\__\__,_|_|_|\___|_|   '
    echo -e ''
    echo -e ''
    echo -e ''
    echo -e ''
}


# Install dependencies
function installdependencies() {
    drawTitellogo
    echo -e ' \n \n \n------------------------------------------------------'
    echo -e 'Install dependencies'
    echo -e '------------------------------------------------------\n'
    composer install --ignore-platform-req=ext-curl
}

#copy environment files
function environmentfiles() {
    drawTitellogo
    echo -e '\n\n\n------------------------------------------------------'
    echo -e 'copy environment files'
    echo -e '------------------------------------------------------\n'
    if [ ! -f .env.example ]; then
    echo -e 'Error: .env.example file not found. Exiting program.\n'
    exit 1
    fi
    if [ -f .env ]; then
    echo -e '.env file already exists, skipping copy.\n'
    else
    cp .env.example .env
    echo -e 'Environment files copied successfully.\n'
    editenvironmentfiles
    fi
}

#edit environment files
function editenvironmentfiles() {
    declare -a keys=("DB_DATABASE" "DB_HOST" "DB_USERNAME" "DB_PASSWORD")
    for key in "${keys[@]}"; do
    echo "Enter the new value for the key ${key}:"
    read value
    # Edit the .env file.
    sed -i "s/${key}=.*$/${key}=${value}/g" .env
    done
}

# Generate a new application key
function application_key_generate() {
    drawTitellogo
    echo -e ' \n \n \n------------------------------------------------------'
    echo -e 'Generate a new application key'
    echo -e '------------------------------------------------------\n'
    php artisan key:generate;
}


# Run database migrations
function database_migrations() {
    drawTitellogo
    echo -e ' \n \n \n------------------------------------------------------'
    echo -e 'Run database migrations'
    echo -e '------------------------------------------------------\n'
    php artisan migrate
}
# first run dependencies
function installdependencies() {
    drawTitellogo
    installdependencies
    environmentfiles
    application_key_generate
    database_migrations
}


while true; do
    clear;
    drawTitellogo
    echo "Select option to run or 'q' to exit:"
    select option in "${!auto_functions[@]}"; do
    if [[ -n "${auto_functions[$option]}" ]]; then
        function_name="${auto_functions[$option]}"
        $function_name  # Call the selected function
    else
        echo -e "Invalid choice. Please select a valid option."
    fi
    read -p "Press any key to continue..."
    break
    done
done
