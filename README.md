# SQL Learning Workspace 🗄️📊

This repository is a **personal SQL learning workspace** built while following the **Codecademy – Learn SQL** course.  
It serves as a structured, hands-on archive of lessons, notes, exercises, and mini-projects, all runnable **locally** using SQLite.

The goal of this repo is simple:  
**learn SQL properly by doing, not just clicking through exercises.**

---

## 👤 Note to Future Me

This repository is intentionally documented for **future reference**.

If you’re reading this months (or years) later:
- Each folder maps directly to a Codecademy chapter
- Tables are recreated locally to avoid black-box learning
- `notes.sql` contains conceptual explanations
- `queries_*.sql` shows worked solutions
- `seed_*.sql` mirrors the original datasets

The goal was not speed, but **understanding and traceability**.
If something feels verbose — that was on purpose.

---

## 🤖 AI Assistance Disclaimer

Parts of this repository — specifically the **creation and seeding of local SQLite tables to mirror Codecademy datasets** — were generated with the assistance of AI.

This was done deliberately to:
- Recreate the learning environment locally
- Focus on understanding SQL concepts (joins, aggregates, relationships)
- Avoid spending time manually copying large datasets

All queries, analysis, structure, and learning decisions were reviewed, understood, and executed by me.
The AI was used as a **tool**, not a replacement for learning.

---

## 📚 Course Coverage

So far, this repository covers the following Codecademy chapters:

### 1. Manipulation ✅
Core data-modification operations:
- `CREATE TABLE`
- `INSERT`
- `UPDATE`
- `DELETE`
- Constraints & basic schema design

📂 Folder: `1_Manipulation/`

---

### 2. Queries ✅
Reading and filtering data:
- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- Logical operators

📂 Folder: `2_Queries/`

---

### 3. Aggregate Functions ✅
Analyzing data with aggregates:
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `ROUND`
- `GROUP BY`
- `HAVING`

📂 Folder: `3_Aggregate_Functions/`

Includes practice projects such as:
- Fake Apps analysis
- Hacker News queries

---

### 4. Multiple Tables ✅
Working with relational data:
- `JOIN` (INNER)
- `LEFT JOIN`
- `CROSS JOIN`
- `UNION`
- `WITH` (CTEs)
- Primary & foreign keys

📂 Folder: `4_Multiple_Tables/`

Includes full projects:
- 📰 Newspaper & Online subscriptions
- 🚗 **Lyft Trip Data project** (joins, aggregates, unions)

---

## 🗂️ Repository Structure

```text
.
├── 1_Manipulation/
├── 2_Queries/
├── 3_Aggregate_Functions/
│   └── Projects/
├── 4_Multiple_Tables/
│   └── Projects/
│       └── 2_Project_Lyft/
├── notes.sql
├── queries_*.sql
├── seed_*.sql
└── README.md


## 🤖 AI Assistance Disclaimer

> **Scope of AI usage**
>
> AI was used to assist with the **creation and seeding of SQLite tables**
> in order to mirror Codecademy datasets locally.

**Purpose:**
- Recreate the course environment
- Practice joins, aggregates, and relational queries
- Avoid repetitive manual data entry

**Ownership:**
All queries, logic, and learning outcomes are my own.  
AI was used as a **tool**, not a substitute for understanding.
