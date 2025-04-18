Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.
 

Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.
 

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.


Return the result table sorted in any order.

The result format is in the following example.

 

Example 1:

Input: 
Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+
Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+
Output: 
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+


# solution-------------------------------------------------------
select v.customer_id, count(*) as count_no_trans from visits v left join transactions t on v.visit_id=t.visit_id  where transaction_id IS NULL group by v.customer_id;

#ALTERNATE SOLUTION                                                         
[SELECT 
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM 
    Visits v
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM Transactions t 
        WHERE t.visit_id = v.visit_id
    )
GROUP BY 
    v.customer_id;]

#How It Works Step-by-Step
#For each row in the main table (outer query)

#Execute the subquery (inner query)

#1.Check if the subquery returns any rows
  #1.1 If no rows are returned → NOT EXISTS evaluates to TRUE → row included in results
  #1.2 If any rows are returned → NOT EXISTS evaluates to FALSE → row excluded
  
