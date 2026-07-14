<p align="center">
  <h1>
    Microproject: Data Modeling (Library)
  </h1>
</p>

<div style="display: flex; align-items: center; padding: 10px;">
  <span>
    <a href="https://github.com/rafael-o-cunha/">
        <img src="https://img.shields.io/badge/-Home-black?style=for-the-badge" alt="Back to Profile">
    </a>
  </span>
</div>

---

<div style="display: flex; align-items: center; padding: 10px;">
  <span>
    <a href="https://github.com/rafael-o-cunha/microprojeto_05_modelagem_de_dados/blob/main/README.md">
      <img src="https://img.shields.io/badge/-Português-green?style=for-the-badge" alt="Portuguese">
    </a>
  </span>

  <span>
    <a href="https://github.com/rafael-o-cunha/microprojeto_05_modelagem_de_dados/blob/main/README_EN.md">
      <img src="https://img.shields.io/badge/-English-blue?style=for-the-badge" alt="English">
    </a>
  </span>

  <span>
    <a href="https://github.com/rafael-o-cunha/microprojeto_05_modelagem_de_dados/blob/main/README_ES.md">
      <img src="https://img.shields.io/badge/-Español-red?style=for-the-badge" alt="Español">
    </a>
  </span>
</div>

---

# 📋 Overview

This microproject was developed to practice the complete data modeling process used during software development.

Using a **School Library Management System** as the business domain, the project covers every major stage of database engineering, from requirements gathering to the physical implementation of the database using PostgreSQL.

Beyond building the database model itself, the project also includes its validation through SQL operations, operational queries, historical queries, management queries, and an evidence document demonstrating that the model satisfies the business requirements.

Rather than simply producing a functional database, this microproject was designed as a practical laboratory to understand how a data model evolves throughout the software development lifecycle.

---

![Final ER Diagram](docs/image/notas/der_materializado.png)

---

> **⚠️ About this microproject**
>
> This project is intended exclusively for educational purposes.
>
> The goal was not only to build a database, but also to practice every stage involved in data modeling as performed in real-world software projects.
>
> To keep the focus on the modeling process, topics such as query optimization, stored procedures, triggers, materialized views, and advanced performance strategies were intentionally left for future microprojects.
>
> In other words, **the objective is not to build the perfect database, but to develop a deep understanding of data modeling fundamentals before moving on to more advanced database architectures and techniques.**

---

# Concepts Practiced

## Requirements Gathering

- Business domain identification
- Functional and non-functional requirements
- Business entity identification
- Information requirements gathering

## Business Rules

- Business rule definition
- Identification of impacted entities
- Traceability between business rules and the data model

## Conceptual Modeling

- Entity identification
- Relationships
- Cardinalities
- ER diagram evolution
- Resolution of many-to-many relationships

## Logical Modeling

- Attribute definition
- Primary keys
- Foreign keys
- Associative entities
- Database normalization

## Data Dictionary

- Attribute documentation
- Data types
- Constraints
- Default values
- Related business rules

## Physical Model

- PostgreSQL implementation
- Constraints
- Referential integrity
- Indexes
- SQL scripts

## Model Validation

The model was validated through:

- CRUD operations
- Operational queries
- Historical queries
- Management queries
- Evidence documentation

---

# Modeling Process

The project followed the workflow below.

- Requirements Gathering
- Business Rules
- Entity Identification
- Entity Relationship Diagram (ERD)
- Data Dictionary
- Validation Queries
- ANSI SQL Implementation
- Evidence Documentation

---

# Produced Artifacts

During the project, the following artifacts were created.

- Requirements Specification
- Business Rules
- Conceptual Model (ERD)
- Logical Model
- Data Dictionary
- Physical Model
- Seed Scripts
- SQL Operations
- Operational Queries
- Historical Queries
- Management Queries
- Evidence Documentation

---

# Technologies

- PostgreSQL
- ANSI SQL
- Docker
- Docker Compose
- Makefile
- DBeaver
- Markdown

---

# 📂 Project Structure

```text
.
├── docs
│   ├── 01-requirements.md
│   ├── 02-business_rules.md
│   ├── 03-data_dictionary.md
│   ├── 04-model_validation.md
│   ├── 05-validation_evidence.md
│   └── image
├── infra
│   └── docker-compose.yml
├── sql
│   ├── 04-model_validation.sql
│   ├── 05-schema_db.sql
│   └── 06-seed_db.sql
└── Makefile
```

---

# Validation

The database was validated through four groups of SQL scripts.

| Group | Purpose |
|------|---------|
| Operations | Validate inserts, updates, and business processes |
| Operational Queries | Answer day-to-day business questions |
| Historical Queries | Retrieve historical information preserved by the model |
| Management Queries | Generate indicators to support decision-making |

---

# Evidence

The project includes an evidence document containing the execution results of the physical database model.

The following validation activities were documented:

- Database creation
- Initial data loading (Seed)
- Execution of SQL operations
- Operational queries
- Historical queries
- Management queries

---

# Concepts Covered

Throughout this microproject, the following concepts were practiced.

- Requirements Engineering
- Business Rules
- Requirements Analysis
- Conceptual Data Modeling
- Entity-Relationship Model (ERM)
- Entity-Relationship Diagram (ERD)
- Cardinalities
- Associative Entities
- Database Normalization
- Logical Data Model
- Physical Data Model
- Data Dictionary
- PostgreSQL
- ANSI SQL
- Primary Keys
- Foreign Keys
- Composite Keys
- Referential Integrity
- Constraints
- Indexes
- DDL Scripts
- DML Scripts
- Database Seeding
- SQL Queries
- Data Governance
- Technical Documentation
- And more...

---

# Future Improvements

Future microprojects may explore topics such as:

→ Views

→ Materialized Views

→ Stored Procedures

→ Functions

→ Triggers

→ Common Table Expressions (CTE)

→ Window 

→ Table Partitioning

→ Indexing Strategies

→ Query Optimization

→ Execution Plans (EXPLAIN)

---

# 📂 Full Project Description

```text
https://rafael-o-cunha.dev/projects/modelagem-de-dados-biblioteca
```
