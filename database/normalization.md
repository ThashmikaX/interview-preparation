# Database Normalization - Q&A

## What is normalization in a database?

Normalization is the process of organizing data in a database to:

- Minimize data redundancy (duplicate data).
- Improve data integrity and consistency.
- Optimize database performance.

## Why is normalization important?

Normalization helps:

- Eliminate data duplication.
- Reduce inconsistencies.
- Ensure data integrity by enforcing rules.
- Improve query performance for structured data.

## What are the different normal forms in normalization?

Normalization consists of 5 main normal forms and BCNF:

1. First Normal Form (1NF): Eliminate duplicate columns and ensure atomicity.
2. Second Normal Form (2NF): Ensure 1NF and remove partial dependencies.
3. Third Normal Form (3NF): Ensure 2NF and remove transitive dependencies.
4. Boyce-Codd Normal Form (BCNF): Stronger version of 3NF.
5. Fourth Normal Form (4NF): Eliminate multi-valued dependencies.
6. Fifth Normal Form (5NF): Handle join dependencies.

## What is the First Normal Form (1NF)?

A table is in 1NF if:

1. All columns contain atomic (indivisible) values.
2. Each row is unique (has a unique identifier like a primary key).
3. Each column has a single value (no repeating groups or arrays).

Example (Non-1NF):
| StudentID | Name | Subjects |
|-----------|--------|------------------|
| 101 | Alice | Math, Science |
| 102 | Bob | English, History |

Converted to 1NF:
| StudentID | Name | Subject |
|-----------|--------|---------|
| 101 | Alice | Math |
| 101 | Alice | Science |
| 102 | Bob | English |
| 102 | Bob | History |

## What is the Second Normal Form (2NF)?

A table is in 2NF if:

1. It is in 1NF.
2. It has no partial dependencies (a non-prime attribute should depend on the entire primary key, not a part of it).

Example (Non-2NF):
| OrderID | ProductID | ProductName | Quantity |
|---------|-----------|---------------|---------|
| 1 | 101 | Laptop | 2 |
| 2 | 102 | Smartphone | 3 |

Here, ProductName depends only on ProductID (a part of the key, not the whole key).

Converted to 2NF:

1. Orders Table:
   | OrderID | ProductID | Quantity |
   |---------|-----------|---------|
   | 1 | 101 | 2 |
   | 2 | 102 | 3 |

2. Products Table:
   | ProductID | ProductName |
   |-----------|---------------|
   | 101 | Laptop |
   | 102 | Smartphone |

## What is the Third Normal Form (3NF)?

A table is in 3NF if:

1. It is in 2NF.
2. It has no transitive dependencies (non-key attributes should not depend on other non-key attributes).

Example (Non-3NF):
| StudentID | Name | Department | DepartmentHead |
|-----------|--------|------------|----------------|
| 101 | Alice | CS | Dr. Smith |
| 102 | Bob | EE | Dr. Jones |

Here, DepartmentHead depends on Department, not directly on StudentID.

Converted to 3NF:

1. Students Table:
   | StudentID | Name | Department |
   |-----------|--------|------------|
   | 101 | Alice | CS |
   | 102 | Bob | EE |

2. Departments Table:
   | Department | DepartmentHead |
   |------------|----------------|
   | CS | Dr. Smith |
   | EE | Dr. Jones |

## What is the Boyce-Codd Normal Form (BCNF)?

A table is in BCNF if:

1. It is in 3NF.
2. For every dependency, the left-hand side is a superkey.

Example (Non-BCNF):
| ProfessorID | Course | Department |
|-------------|--------------|------------|
| 1 | Databases | CS |
| 2 | Networks | EE |

Here, Course → Department violates BCNF because Course is not a superkey.

Converted to BCNF:

1. ProfessorCourses Table:
   | ProfessorID | Course |
   |-------------|------------|
   | 1 | Databases |
   | 2 | Networks |

2. Courses Table:
   | Course | Department |
   |------------|------------|
   | Databases | CS |
   | Networks | EE |

## What is the Fourth Normal Form (4NF)?

A table is in 4NF if:

1. It is in BCNF.
2. It has no multi-valued dependencies.

Example (Non-4NF):
| StudentID | Course | Hobby |
|-----------|------------|--------------|
| 101 | Math | Painting |
| 101 | Math | Music |
| 101 | Science | Painting |

Converted to 4NF:

1. StudentCourses Table:
   | StudentID | Course |
   |-----------|------------|
   | 101 | Math |
   | 101 | Science |

2. StudentHobbies Table:
   | StudentID | Hobby |
   |-----------|------------|
   | 101 | Painting |
   | 101 | Music |

## What is the Fifth Normal Form (5NF)?

A table is in 5NF if:

1. It is in 4NF.
2. It handles join dependencies (data cannot be further split without losing information).

## What is denormalization?

Denormalization is the process of combining tables to:

- Improve read performance.
- Reduce complex joins.

However, it increases data redundancy.

## What are the advantages of normalization?

- Reduces data duplication.
- Ensures data integrity.
- Simplifies data maintenance.
- Improves update performance.

## What are the disadvantages of normalization?

- Complex queries due to multiple joins.
- Performance overhead in read-heavy systems.
- More tables require complex management.

## When would you use denormalization?

- In read-heavy applications where performance matters.
- For reporting systems requiring fewer joins.
- When scalability is prioritized over strict normalization.

## What is partial dependency?

A partial dependency exists when a non-prime attribute depends on part of a composite key.

## What is transitive dependency?

A transitive dependency exists when a non-key attribute depends on another non-key attribute.

## What is the difference between BCNF and 3NF?

| Feature         | 3NF                      | BCNF                          |
| --------------- | ------------------------ | ----------------------------- |
| Dependency Rule | No transitive dependency | Every determinant is a key    |
| Key Requirement | Non-prime depends on key | Every left-side is a superkey |
| Strictness      | Less strict              | More strict                   |

## What is a surrogate key?

A surrogate key is an artificial primary key (e.g., auto-increment ID) that uniquely identifies records.

## How does normalization affect indexing?

Normalization reduces the size of tables, improving indexing performance and reducing index maintenance.
