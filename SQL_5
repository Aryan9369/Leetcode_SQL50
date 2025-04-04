Table: Tweets

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
tweet_id is the primary key (column with unique values) for this table.
content consists of alphanumeric characters, '!', or ' ' and no other special characters.
This table contains all the tweets in a social media app.
 

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

SOLUTION-
select tweet_id from tweets where length(content)>15;

/* Alternative method without using length
SELECT tweet_id
FROM Tweets
WHERE SUBSTRING(content, 16, 1) IS NOT NULL;
SUBSTRING(content, 16, 1): tries to get the 16th character.

If the content has 15 or fewer characters, this will return NULL.*/
