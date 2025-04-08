#A self join is a special type of join where a table is joined with itself. It's useful when you need to compare rows within the same table.
In a self join:
  1. You treat the same table as two different tables using table aliases
  2. You join them based on some relationship between columns in the same table

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |


# soltuion
#DATEDIFF(date_part, start_date, end_date)

##but here we use like this {DATEDIFF(end_date,start date)=1} because we have to compare current date with previous one(yesterday)#
select w1.id from weather w1 join weather w2 on DATEDIFF(w1.recordDate,w2.recordDate)=1 where w1.temperature>w2.temperature;
