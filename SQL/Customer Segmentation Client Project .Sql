SHOW TABLES;

SELECT * FROM shopping_table;
select * from std;


# Total Customers
select count(*) as Total_Customers
from shopping_table;

# Total Revenue
select sum(Purchase_Amount_USD) as total_revenue
from shopping_table;

# Average Purchase Amount
SELECT ROUND(AVG(Purchase_Amount_USD),2) AS Average_Purchase_Amount
FROM shopping_table;

# Average Customer Age
SELECT ROUND(AVG(Age),2) AS Average_Age
FROM shopping_table;


# Average Review Rating
SELECT ROUND(AVG(Review_Rating),2) AS Average_Review_Rating
FROM shopping_table;


SELECT
COUNT(*) AS Total_Records,
SUM(Purchase_Amount_USD) AS Total_Revenue,
ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Purchase,
ROUND(AVG(Age),2) AS Avg_Age,
ROUND(AVG(Review_Rating),2) AS Avg_Rating
FROM shopping_table;

SELECT
    Category,
    COUNT(*) AS Total_Orders,
    SUM(Purchase_Amount_USD) AS Total_Revenue,
    ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Purchase
FROM shopping_table
GROUP BY Category
ORDER BY Total_Revenue DESC;

select  Category,
Discount_Applied,
count(*) as Orders,
sum(Purchase_Amount_USD) as Total_Revenue
from shopping_table
group by Category , Discount_Applied
order by Total_Revenue desc;

SELECT
    Discount_Applied,
    COUNT(*) AS Orders,
    ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Purchase,
    SUM(Purchase_Amount_USD) AS Total_Revenue
FROM shopping_table
GROUP BY Discount_Applied;

SELECT
    Category,
    ROUND(AVG(Review_Rating),2) AS Avg_Rating,
    COUNT(*) AS Orders,
    SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_table
GROUP BY Category
ORDER BY Avg_Rating ASC;

SELECT
    Category,
    ROUND(AVG(Previous_Purchases),2) AS Avg_Previous_Purchases,
    COUNT(*) AS Orders,
    SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_table
GROUP BY Category
ORDER BY Avg_Previous_Purchases ASC;

SELECT
    Season,
    Category,
    COUNT(*) AS Orders,
    SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_table
GROUP BY Season, Category
ORDER BY Season, Revenue DESC;

SELECT
    Category,
    COUNT(*) AS Orders,
    SUM(Purchase_Amount_USD) AS Revenue,
    ROUND(
        SUM(Purchase_Amount_USD) * 100.0 /
        (SELECT SUM(Purchase_Amount_USD) FROM shopping_table),
        2
    ) AS Revenue_Percentage
FROM shopping_table
GROUP BY Category
ORDER BY Revenue DESC;

# 
select 
case
when Age between 18 and 25 then "Young Adults"
when Age between 26 and 35 then "Adults"
when Age between 36 and 45 then "Middle Age"
when Age between 46 and 55 then "Mature Adults"
else 56 + "Senior"
end as Age_Group,
count(*) as Customers,
sum(Purchase_Amount_USD) as Revenue,
ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Purchase
from shopping_table
group by Age_Group 
order by Age_Group;


SELECT
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS Age_Group,
COUNT(*) AS Customers,
SUM(Purchase_Amount_USD) AS Revenue,
ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Purchase
FROM shopping_table
GROUP BY Age_Group
ORDER BY Age_Group;

SELECT
    Season,
    COUNT(*) AS Customers
FROM shopping_table
GROUP BY Season
ORDER BY Customers DESC;

SELECT
    Season,
    COUNT(*) AS Customers
FROM shopping_table
GROUP BY Season
ORDER BY Customers DESC;

SELECT
    Location,
    COUNT(*) AS Total_Customers,
    SUM(Purchase_Amount_USD) AS Revenue,
    ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Purchase
FROM shopping_table
GROUP BY Location
ORDER BY Revenue DESC;

SELECT * FROM shopping_table
LIMIT 10;