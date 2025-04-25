# 📝 Assignment: Database Design and Normalization

## 🎯 **Learning Objectives**
* 🛠️ **Understand the principles of good database design** and **normalization**.
* 💡 **Apply normalization techniques** to improve database structure and efficiency.
* 🔍 **Learn First, Second, and Third Normal Forms** (1NF, 2NF, 3NF) to eliminate redundancy and optimize data storage.

---

## 📋 **What You'll Need**
* 💻 A computer with internet access.
* ✍️ A code editor (e.g., Visual Studio Code).
* 🖥️ MySQL Workbench or another SQL database environment.

---


## 📝 Submission Instructions  
📂 Write all your SQL queries in the **answers.sql** file.  
✍️ Answer each question concisely and make sure your queries are clear and correct.  
🗣️ Structure your responses clearly, and use comments if necessary to explain your approach.

--- 

## 📚 Assignment Questions

---

### Question 1 Achieving 1NF (First Normal Form) 🛠️
Task:
- You are given the following table **ProductDetail**:

| OrderID | CustomerName  | Products                        |
|---------|---------------|---------------------------------|
| 101     | John Doe      | Laptop, Mouse                   |
| 102     | Jane Smith    | Tablet, Keyboard, Mouse         |
| 103     | Emily Clark   | Phone                           |


- In the table above, the **Products column** contains multiple values, which violates **1NF**.
- **Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order

--- 

### Question 2 Achieving 2NF (Second Normal Form) 🧩

- You are given the following table **OrderDetails**, which is already in **1NF** but still contains partial dependencies:

| OrderID | CustomerName  | Product      | Quantity |
|---------|---------------|--------------|----------|
| 101     | John Doe      | Laptop       | 2        |
| 101     | John Doe      | Mouse        | 1        |
| 102     | Jane Smith    | Tablet       | 3        |
| 102     | Jane Smith    | Keyboard     | 1        |
| 102     | Jane Smith    | Mouse        | 2        |
| 103     | Emily Clark   | Phone        | 1        |

In the table above, the `CustomerName` column depends on `OrderID` (a partial dependency), which violates 2NF. Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

## ✅ Assignment Completion
The assignment has been completed, and the SQL queries for both questions are implemented in the `answers.sql` file. Below is a summary of the work done:

- **Question 1**: Transformed the `ProductDetail` table into 1NF by creating a new table `ProductDetail_1NF` where each row represents a single product. The multi-valued `Products` column was split into separate rows, and a composite primary key (`OrderID`, `Product`) was used to ensure uniqueness.
- **Question 2**: Transformed the `OrderDetails` table into 2NF by removing the partial dependency of `CustomerName` on `OrderID`. Created two tables:
  - `Orders`: Stores `OrderID` and `CustomerName` with `OrderID` as the primary key.
  - `OrderItems`: Stores `OrderID`, `Product`, and `Quantity` with a composite primary key (`OrderID`, `Product`) and a foreign key referencing `Orders`. 

The queries include comments for clarity and have been structured to work in a MySQL environment.

## 🚀 Next Steps
- Test the queries in your SQL environment (e.g., MySQL Workbench) to verify they work with the provided database schema.
- Submit the repository by committing and pushing the changes to GitHub.

Good luck 🚀

## About
plp-database-module-2025-wk-7a-psd-07 created by GitHub Classroom
