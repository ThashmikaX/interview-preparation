# Database Indexing - Q&A

## What is an index in a database?

An index is a data structure that improves the speed of data retrieval operations on a database table. It works like a table of contents, allowing the database engine to find rows faster without scanning the entire table.

## How does an index work?

An index creates a separate structure (usually a B-tree or hash table) that stores:

- Indexed column(s)
- Pointers to the actual rows

When a query searches using the indexed column, the database looks at the index first, finds the row location, and retrieves the data efficiently.

## What are the types of database indexes?

1. Primary Index: Automatically created on the primary key.
2. Unique Index: Enforces uniqueness of values in a column.
3. Composite Index: Built on multiple columns.
4. Clustered Index: Rearranges the physical order of rows to match the index.
5. Non-Clustered Index: Creates a separate structure for quick lookups.
6. Full-Text Index: Optimized for searching text data (e.g., keywords).
7. Bitmap Index: Uses bitmaps for columns with low cardinality (few unique values).
8. Function-Based Index: Indexes the result of a function or expression.

## What is the difference between a clustered and a non-clustered index?

| Feature          | Clustered Index                      | Non-Clustered Index          |
| ---------------- | ------------------------------------ | ---------------------------- |
| Physical Order   | Rearranges data in physical order    | Keeps data in original order |
| Number per Table | One (usually on the primary key)     | Many (up to database limits) |
| Speed for Reads  | Faster for large-range queries       | Slower for large datasets    |
| Storage Overhead | Requires more space for table itself | Requires separate storage    |
| Example          | Primary key on `id` column           | Index on `name` column       |

## What is a composite index?

A composite index is an index on two or more columns. It is useful when queries filter by multiple conditions.

Example:

```sql
CREATE INDEX idx_user_name_email ON users(name, email);
```

Order matters: This index is efficient for queries like:

````sql
SELECT \* FROM users WHERE name = 'John' AND email = 'john@example.com';
But not optimized for:

SELECT \* FROM users WHERE email = 'john@example.com'; 6. What is a unique index?
A unique index ensures that no duplicate values exist in the indexed column(s).

Example:
```sql
CREATE UNIQUE INDEX idx_email ON users(email);
````

If you try to insert a duplicate:

```sql
INSERT INTO users (email) VALUES ('duplicate@example.com');
The database will throw an error.
```

## What is a partial index?

A partial index indexes only rows that meet a specific condition.

Example (PostgreSQL):

````sql
CREATE INDEX idx_active_users ON users(email) WHERE status = 'active';
```

This index only applies to active users, saving space and improving query performance.

## What is a covering index?

A covering index contains all columns needed to satisfy a query. This avoids accessing the main table.

Example:
```sql
CREATE INDEX idx_order ON orders(order_id, customer_id);
```

For the query:

```sql
SELECT order_id, customer_id FROM orders WHERE order_id = 123;
```

The database can retrieve the data only from the index.

## What is the difference between a B-tree and a hash index?

Feature B-tree Index Hash Index
Structure Balanced tree Key-value pairs
Use Case Range and equality searches Exact matches only
Performance Slower for exact matches Faster for exact matches
Range Queries Supported Not supported
Example DBs MySQL (InnoDB), PostgreSQL PostgreSQL (hash indexes)

## What is index cardinality?

    Cardinality refers to the number of unique values in an indexed column.

High cardinality: Many unique values (e.g., phone numbers).
Low cardinality: Few repeated values (e.g., boolean flags).
High-cardinality columns benefit the most from indexing.

## What are the advantages of indexing?

    Faster searches: Reduces the time to retrieve rows.
    Improved sorting: Speeds up ORDER BY and GROUP BY.
    Efficient joins: Optimizes complex joins between tables.
    Enforcing uniqueness: Unique indexes prevent duplicate entries.

## What are the disadvantages of indexing?

    Increased storage: Indexes require additional space.
    Slower writes: INSERT, UPDATE, DELETE operations are slower due to index maintenance.
    Complexity: Over-indexing increases query optimizer complexity.
    Fragmentation: Frequent updates can cause index fragmentation, reducing performance.

## What is index fragmentation?

    Index fragmentation occurs when:

Data is updated or deleted.
Indexed pages become disorganized.
This leads to slower query performance and increased I/O.

Fix: Use index rebuilding:

ALTER INDEX idx_name REBUILD;

## What is a functional index?

A functional index is created on the result of a function or expression.

Example (PostgreSQL):

CREATE INDEX idx_lower_name ON users (LOWER(name));
Allows efficient querying:

SELECT \* FROM users WHERE LOWER(name) = 'john';

## How do you monitor index performance?

MySQL: Use SHOW INDEX FROM table;
PostgreSQL: Use pg_stat_user_indexes
SQL Server: Use sys.dm_db_index_usage_stats 16. What is an invisible index?
An invisible index exists but is ignored by the query optimizer.

Example (MySQL):
```sql
ALTER INDEX idx_name INVISIBLE;
```

Useful for testing index performance without deleting it.

## When should you not use an index?

    Small tables: Full table scans are faster.
    Low-cardinality columns: Few unique values (e.g., boolean flags).
    Frequent updates: Dynamic columns slow down due to reindexing.

## How do indexes affect ORDER BY and GROUP BY?

    Indexes improve:

ORDER BY: When indexed columns match the order.
GROUP BY: When grouped on indexed columns.
Without an index, these operations require a full table scan.

## What is index selectivity?

    Selectivity measures how unique indexed values are:

# Selectivity

Distinct Values
Total Rows
Selectivity=
Total Rows
Distinct Values
​

High selectivity: Best for indexing (e.g., IDs).
Low selectivity: Less effective (e.g., boolean flags).

## What is a descending index?

A descending index sorts data in descending order.

Example (PostgreSQL):
```sql
CREATE INDEX idx_desc_price ON products (price DESC);
```

Speeds up queries with:
```sql
SELECT \* FROM products ORDER BY price DESC;
```


````
