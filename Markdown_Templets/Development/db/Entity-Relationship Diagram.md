```markdown
# Entity-Relationship Diagram (ERD)

```

| Entity | Attributes |
|--------|------------|
| User   | ID, Name, Email |
| Product | ID, Name, Price, Description |
| Order   | ID, User_ID, Date |
| Order_Item | Order_ID, Product_ID, Quantity |

```

### Relationships
- One User can place Many Orders (One-to-Many)
- One Order can have Many Order Items (One-to-Many)
- One Product can be in Many Order Items (One-to-Many)
```
