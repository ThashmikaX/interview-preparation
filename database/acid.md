# ACID Principles - Q&A

## What does ACID stand for in databases?

ACID stands for:

- A - Atomicity: Ensures transactions are all-or-nothing.
- C - Consistency: Ensures data remains valid before and after a transaction.
- I - Isolation: Ensures concurrent transactions do not affect each other.
- D - Durability: Ensures completed transactions are permanently stored.

## Why ACID properties important?

ACID properties ensure data integrity and reliability in databases, even in cases of system crashes, power failures, or concurrent access.

## What is atomicity in ACID?

Atomicity guarantees that:

- A transaction is treated as a single unit.
- Either all operations in the transaction succeed, or none of them do.

Example:
When transferring money between two accounts, both debit and credit operations must succeed together.

## What is consistency in ACID?

Consistency ensures that:

- A transaction brings the database from one valid state to another.
- Integrity constraints (e.g., unique keys, foreign keys) are maintained.

Example:
A bank balance should not become negative if the system enforces non-negative balances.

## What is isolation in ACID?

Isolation ensures that:

- Concurrent transactions execute independently of each other.
- Transactions do not interfere with each other’s operations.

Example:
Two customers withdrawing money simultaneously should not result in an incorrect balance due to overlapping operations.

## What is durability in ACID?

Durability ensures that:

- Once a transaction is committed, its changes are permanent.
- Even in case of a system crash, the changes remain intact.

Example:
After a successful money transfer, the updated balances must persist even if the server crashes.

## How do databases ensure atomicity?

- Undo logs: Roll back incomplete transactions.
- Transaction logs: Record all actions to ensure a complete rollback if needed.

## How do databases ensure consistency?

- Constraints: Enforce rules like `PRIMARY KEY`, `FOREIGN KEY`.
- Validation: Ensure that data meets the schema’s requirements.

## How do databases ensure isolation?

- Locking: Apply row-level, table-level, or page-level locks.
- Multi-Version Concurrency Control (MVCC): Allows multiple versions of data for different transactions.

## How do databases ensure durability?

- Write-Ahead Logging (WAL): Write logs before applying changes.
- Checkpoints: Periodically save snapshots of the database.

## What are isolation levels in databases?

Isolation levels define how strictly transactions are isolated. Common levels:

1. Read Uncommitted: No isolation, dirty reads allowed.
2. Read Committed: Only committed data is read (prevents dirty reads).
3. Repeatable Read: Ensures same result for repeated reads (prevents non-repeatable reads).
4. Serializable: Full isolation, transactions appear as if executed sequentially.

## What are dirty reads, non-repeatable reads, and phantom reads?

| Issue               | Description                         | Isolation Level Prevention |
| ------------------- | ----------------------------------- | -------------------------- |
| Dirty Read          | Reading uncommitted data            | Read Committed and above   |
| Non-Repeatable Read | Data changes between two reads      | Repeatable Read and above  |
| Phantom Read        | New rows added during a transaction | Serializable               |

## What is the difference between atomicity and durability?

| Property   | Description                                |
| ---------- | ------------------------------------------ |
| Atomicity  | All-or-nothing execution of a transaction. |
| Durability | Once committed, changes are permanent.     |

## What is a transaction in the context of ACID?

A transaction is a sequence of one or more operations performed as a single logical unit.

Example SQL transaction:

```sql
BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

## What is the difference between a commit and a rollback?

COMMIT: Finalizes the transaction, making changes permanent.
ROLLBACK: Undoes all operations, returning the database to the previous state.

## What is a two-phase commit (2PC)?

A distributed transaction protocol ensuring atomicity across multiple databases.

Phases:

Prepare: Each database checks if it can commit.
Commit: If all databases agree, the transaction is committed.

## What is the role of logs in ACID compliance?

Logs store transaction details to ensure:

Atomicity: Rollback incomplete transactions.
Durability: Replay committed transactions after a crash.

## How do ACID properties impact database performance?

Higher isolation (e.g., serializable) can reduce concurrency and slow performance.
Durability requires disk writes, which may increase latency. 19. What happens if a database crashes during a transaction?
If a database crashes:

Before COMMIT: Changes are rolled back (atomicity).
After COMMIT: Changes are reapplied from logs (durability).

## What are some databases that fully support ACID?

Relational Databases: MySQL (InnoDB), PostgreSQL, SQL Server, Oracle.
NoSQL: Some document stores like MongoDB (with transaction support).

## How does ACID differ from BASE in databases?

Feature ACID (Traditional RDBMS) BASE (NoSQL)
Consistency Strong (Immediate) Eventual (Delayed)
Transactions Supported (Strict) Rare (Best-effort)
Scalability Limited (Vertical Scaling) High (Horizontal Scaling)
Performance Slower (Strict Guarantees) Faster (Weaker Guarantees)

## What challenges arise in maintaining ACID properties in distributed databases?

Network Failures: Ensure atomicity across nodes.
Data Consistency: Implement consensus algorithms (e.g., Paxos, Raft).
Performance: Overhead from synchronization across nodes.

## What is idempotency and its relation to ACID?

Idempotency means repeated execution of a transaction yields the same outcome.

Example: Re-issuing a payment request should not double-charge.

## Why is ACID crucial in financial applications?

Financial systems require accuracy and reliability where:

Atomicity prevents partial updates (e.g., money lost).
Consistency enforces business rules.
Isolation prevents race conditions.
Durability guarantees transaction records persist.

## What are the trade-offs between ACID and performance?

Strong ACID ensures data integrity but reduces throughput.
Relaxing isolation (e.g., using Read Committed) can improve performance.
