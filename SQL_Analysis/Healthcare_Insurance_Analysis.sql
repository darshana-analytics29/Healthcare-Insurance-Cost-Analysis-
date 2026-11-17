-- Create a table to store the cleaned healthcare insurance dataset.
CREATE TABLE insurance_customers (
    age INTEGER,
    sex VARCHAR(10),
    bmi NUMERIC(5,2),
    children INTEGER,
    smoker VARCHAR(5),
    region VARCHAR(20),
    charges NUMERIC(10,2),
    age_group VARCHAR(20)
);

select * from insurance_customers;

-- Count the total number of customer records imported into the table.
SELECT COUNT(*) AS total_customers
FROM insurance_customers;

-- Retrieve the names and data types of all columns in the imported table.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'insurance_customers';

-- Identify customers whose insurance charges are greater than 30,000.
SELECT age, sex, smoker, region, charges
FROM insurance_customers
WHERE charges > 30000; -- 162

-- Retrieve customer details for all smokers.
SELECT age, bmi, children, charges
FROM insurance_customers
WHERE smoker = 'yes';  -- 274

-- Identify customers in the Southeast region whose insurance charges exceed 20,000.
SELECT age, sex, smoker, bmi, charges
FROM insurance_customers
WHERE region = 'southeast'
AND charges > 20000;  -- 88

-- Display the 10 customers with the highest insurance charges.
SELECT age, sex, smoker, bmi, region, charges
FROM insurance_customers
ORDER BY charges DESC
LIMIT 10;

-- Display the 10 customers with the lowest insurance charges.
SELECT age, sex, smoker, bmi, region, charges
FROM insurance_customers
ORDER BY charges 
LIMIT 10;

-- Display the 10 oldest customers in the dataset.
SELECT age, sex, smoker, charges
FROM insurance_customers
ORDER BY age DESC
LIMIT 10;

-- Calculate the average insurance charges for smokers and non-smokers.
-- GROUP BY separates customers into smoking-status groups.
SELECT
    smoker,
    AVG(charges) AS average_charges
FROM insurance_customers
GROUP BY smoker;

-- Calculate the total recorded insurance charges for each geographical region.
-- SUM() adds the insurance charges within each region.
SELECT
    region,
    sum(charges) AS total_charges
FROM insurance_customers
GROUP BY region
ORDER BY total_charges DESC;

-- Calculate the average insurance charges for each customer age group.
SELECT
    age_group,
    AVG(charges) AS average_charges
FROM insurance_customers
GROUP BY age_group
ORDER BY average_charges DESC;

-- Identify age groups whose average insurance charges exceed 15,000.
SELECT
    age_group,
    AVG(charges) AS average_charges
FROM insurance_customers
GROUP BY age_group
HAVING AVG(charges) > 15000
ORDER BY average_charges DESC;

-- Compare the minimum and maximum insurance charges of smokers and non-smokers.
SELECT
    smoker,
    MIN(charges) AS minimum_charges,
    MAX(charges) AS maximum_charges
FROM insurance_customers
GROUP BY smoker;

-- Identify geographical regions with total insurance charges exceeding 4 million.
SELECT
    region,
    SUM(charges) AS total_charges
FROM insurance_customers
GROUP BY region
HAVING SUM(charges) > 4000000
ORDER BY total_charges DESC;

-- Compare average insurance charges by smoking status within each age group.
SELECT
    age_group,
    smoker,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charges
FROM insurance_customers
GROUP BY age_group, smoker
ORDER BY age_group, smoker;

-- Categorize customers into low, medium, and high insurance-charge groups.
SELECT
    CASE
        WHEN charges < 10000 THEN 'Low Charges'
        WHEN charges <= 30000 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS charge_category,
    COUNT(*) AS customer_count
FROM insurance_customers
GROUP BY charge_category
ORDER BY customer_count DESC;

-- Rank geographical regions according to their average insurance charges.
SELECT
    region,
    ROUND(AVG(charges), 2) AS average_charges,
    RANK() OVER (ORDER BY AVG(charges) DESC) AS region_rank
FROM insurance_customers
GROUP BY region;

-- Compare customer count and average insurance charges
-- across BMI categories and smoking status.
SELECT
    CASE
        WHEN bmi < 25 THEN 'Below 25'
        WHEN bmi < 30 THEN '25 to 29.9'
        ELSE '30 and Above'
    END AS bmi_category,
    smoker,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charges
FROM insurance_customers
GROUP BY bmi_category, smoker
ORDER BY bmi_category, smoker;

-- Compare customer count and average insurance charges
-- according to the number of children.
SELECT
    children,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charges,
    ROUND(SUM(charges), 2) AS total_charges
FROM insurance_customers
GROUP BY children
ORDER BY children;

-- Calculate the percentage contribution of smokers and non-smokers
-- to the total recorded insurance charges.
SELECT
    smoker,
    ROUND(SUM(charges), 2) AS group_total_charges,
    ROUND(
        100.0 * SUM(charges) / SUM(SUM(charges)) OVER (),
        2
    ) AS percentage_of_total_charges
FROM insurance_customers
GROUP BY smoker
ORDER BY percentage_of_total_charges DESC;

-- Identify age and smoking-status segments whose average charges
-- exceed the overall average insurance charges.
WITH segment_analysis AS (
    SELECT
        age_group,
        smoker,
        COUNT(*) AS customer_count,
        AVG(charges) AS average_charges
    FROM insurance_customers
    GROUP BY age_group, smoker
)
SELECT
    age_group,
    smoker,
    customer_count,
    ROUND(average_charges, 2) AS average_charges
FROM segment_analysis
WHERE average_charges > (
    SELECT AVG(charges)
    FROM insurance_customers
)
ORDER BY average_charges DESC;

-- Calculate the percentage of customers belonging to each geographical region.
SELECT
    region,
    COUNT(*) AS customer_count,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage
FROM insurance_customers
GROUP BY region
ORDER BY customer_percentage DESC;

-- Rank customer segments by their average insurance charges.
WITH bmi_smoking_segments AS (
    SELECT
        CASE
            WHEN bmi < 25 THEN 'Below 25'
            WHEN bmi < 30 THEN '25 to 29.9'
            ELSE '30 and Above'
        END AS bmi_category,
        smoker,
        AVG(charges) AS average_charges
    FROM insurance_customers
    GROUP BY bmi_category, smoker
)
SELECT
    bmi_category,
    smoker,
    ROUND(average_charges, 2) AS average_charges,
    DENSE_RANK() OVER (
        ORDER BY average_charges DESC
    ) AS segment_rank
FROM bmi_smoking_segments;

-- Compare average insurance charges across gender and smoking-status groups.
SELECT
    sex,
    smoker,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charges
FROM insurance_customers
GROUP BY sex, smoker
ORDER BY sex, smoker;

-- Compare average insurance charges across geographical regions and age groups.
SELECT
    region,
    age_group,
    COUNT(*) AS customer_count,
    ROUND(AVG(charges), 2) AS average_charges
FROM insurance_customers
GROUP BY region, age_group
ORDER BY region, average_charges DESC;

-- Calculate each age group's contribution to total recorded insurance charges.
SELECT
age_group,
    ROUND(SUM(charges), 2) AS total_charges,
    ROUND(
        100.0 * SUM(charges) / SUM(SUM(charges)) OVER (),
        2
    ) AS percentage_contribution
FROM insurance_customers
GROUP BY age_group
ORDER BY percentage_contribution DESC;

-- Identify the five age-group and smoking-status segments
-- contributing the highest total insurance charges.
SELECT
    age_group,
    smoker,
    COUNT(*) AS customer_count,
    ROUND(SUM(charges), 2) AS total_charges
FROM insurance_customers
GROUP BY age_group, smoker
ORDER BY total_charges DESC
LIMIT 5;

-- Compare individual customer charges with the average charges
-- of their respective age groups.
SELECT
    age,
    age_group,
    smoker,
    charges,
    ROUND(
        AVG(charges) OVER (PARTITION BY age_group), 2
    ) AS age_group_average
FROM insurance_customers
ORDER BY age_group, charges DESC
LIMIT 20;

-- Classify individual customers according to whether their charges
-- are above or below the overall average insurance charges.

SELECT
    age,
    sex,
    smoker,
    charges,
    CASE
        WHEN charges > (SELECT AVG(charges) FROM insurance_customers)
            THEN 'Above Average'
        ELSE 'At or Below Average'
    END AS charge_comparison
FROM insurance_customers
ORDER BY charges DESC
LIMIT 20;