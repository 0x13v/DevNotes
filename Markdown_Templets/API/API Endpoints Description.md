## Endpoints

### `METHOD /Endpoint`

Returns a list of all data in the Endpoint.

### Parameters
- ##### Header Parameters
``` Json
 token: "token"
```
- ##### Body Parameters
``` Json
{
    "email":"User@Example.com",
    "password":"1234"
}

```

### RESPONSES
  
- ### 200 - Result
- success
``` Json
{
    "results": {},
    "message": "success",
    "status": 200
}
```
- ### 400 - Result
- ERROR
``` Json
{
    "results": {},
    "message": "success",
    "status": 400
}
```

### Example

Request:

``` bash
curl -i -H 'Accept: application/json' -H 'token: "token"' -d 'email=example&password=test' -X POST http://localhost:8000/
```

Response:

```json
{
    "results": {},
    "message": "success",
    "status": 200
}
```

# Responses

## Create (C) Response
    - `201 Created`: The resource has been successfully created.
    - `400 Bad Request`: The request was malformed or missing required parameters.
    - `401 Unauthorized`: The API key provided was invalid or missing.
    - `500 Internal Server` Error: An unexpected error occurred on the server.
## Read (R) Response
    - `200 OK`: The request for the resource was successful.
    - `400 Bad Request`: The request was malformed or missing required parameters.
    - `401 Unauthorized`: The API key provided was invalid or missing.
    - `404 Not Found`: The requested resource was not found.
    - `500 Internal Server Error`: An unexpected error occurred on the server.
## Update (U) Response
    - `200 OK`: The resource has been successfully updated.
    - `400 Bad Request`: The request was malformed or missing required parameters.
    - `401 Unauthorized`: The API key provided was invalid or missing.
    - `404 Not Found`: The requested resource was not found.
    - `500 Internal Server Error`: An unexpected error occurred on the server.
## Delete (D) Response
    - `204 No Content`: The resource has been successfully deleted.
    - `401 Unauthorized`: The API key provided was invalid or missing.
    - `404 Not Found`: The requested resource was not found.
    - `500 Internal Server Error`: An unexpected error occurred on the server.
