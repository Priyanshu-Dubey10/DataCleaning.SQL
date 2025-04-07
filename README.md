# 📊 Layoffs Dataset - SQL Data Cleaning Project

## 🧹 Project Overview

This project demonstrates the step-by-step process of cleaning a real-world dataset containing layoff data using **MySQL**. Data cleaning is a critical step in data analysis to ensure the quality and reliability of insights.

The goal was to clean and standardize the dataset for further analysis by handling issues like duplicates, inconsistent formats, null values, and incorrect data types.

---

## 🔧 Tools & Skills Used

- **MySQL**
- SQL Window Functions (`ROW_NUMBER`)
- `CTE` (Common Table Expressions)
- `TRIM`, `STR_TO_DATE`, and `UPDATE` functions
- Data type modification
- Data transformation and standardization techniques

---

## 🗂️ Steps Performed

### 1. ✅ **Creating a Working Copy**
Created a duplicate table `layoffs_stage` to perform transformations without affecting the source.

### 2. 🚫 **Removing Duplicates**
Used `ROW_NUMBER()` with `PARTITION BY` inside a CTE to detect and remove duplicate rows.

### 3. 🎨 **Standardizing Text Data**
- Trimmed whitespace using `TRIM()`.
- Standardized inconsistent entries like `'crypto%' → 'Crypto'` and `'United States%' → 'United States'`.

### 4. ⚙️ **Handling Null and Blank Values**
- Replaced missing `industry` values based on company context (e.g., “Juul” → “Consumer”).
- Removed rows where both `total_laid_off` and `percentage_laid_off` were null.

### 5. 📅 **Fixing Date Format**
- Converted date strings (`mm/dd/yyyy`) to `DATE` format using `STR_TO_DATE()`.

### 6. 🔧 **Changing Data Types**
- Changed the column type of `percentage_laid_off` from `varchar` to `int` for consistency.

---

## 📁 File Included

- `Layoffs_Data_Cleaning_Project.pdf`: Contains all SQL queries and cleaning steps used.

---

## 📌 Key Learnings

- Practical experience in cleaning real-world data with SQL.
- Deep understanding of data quality issues and how to resolve them.
- Strengthened skills in using SQL functions and schema management.

---

## 📬 Contact

**Priyanshu Dubey**  
*Data Analyst | SQL • Power BI • Python*  
📧 priyudubey332@gmail.com  

