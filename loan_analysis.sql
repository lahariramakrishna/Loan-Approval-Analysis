USE loan_analysis;
-- Q1. OverAll Loan Approval Rate
SELECT Loan_Status,
COUNT(*) AS total,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data), 2) AS percentage
FROM loan_data
GROUP BY Loan_Status;

-- Q2: Approval Rate by Gender
-- This query analyzes whether gender affects loan approval chances
USE loan_analysis;
SELECT Gender,
COUNT(*) AS total_applicants,
SUM(Loan_Approved) AS approved,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY Gender;

-- Q3: Approval Rate by Credit History
-- Credit history is one of the most important factors in loan approval
USE loan_analysis;
SELECT Credit_History,
COUNT(*) AS total_applicants,
SUM(Loan_Approved) AS approved,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY Credit_History;

-- Q4: Approval Rate by Property Area
-- Analyzing how location affects loan approval chances
USE loan_analysis;
SELECT Property_Area,
COUNT(*) AS total_applicants,
SUM(Loan_Approved) AS approved,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY Property_Area
ORDER BY approval_rate DESC;

-- Q5: Average Loan Amount by Education
-- Analyzing if education level affects the loan amount requested
USE loan_analysis;
SELECT Education,
COUNT(*) AS total_applicants,
ROUND(AVG(LoanAmount), 2) AS avg_loan_amount,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY Education;

-- Q6: Applicants who requested above average loan amount
-- Using subquery to find high value loan applicants and their approval rate
USE loan_analysis;
SELECT 
CASE WHEN LoanAmount > (SELECT AVG(LoanAmount) FROM loan_data) 
     THEN 'Above Average' 
     ELSE 'Below Average' 
END AS loan_category,
COUNT(*) AS total_applicants,
SUM(Loan_Approved) AS approved,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY loan_category;

-- Q7: Approval rate by income group using CTE
-- CTE to segment customers by income and analyze approval patterns
USE loan_analysis;
WITH income_segments AS (
    SELECT *,
    CASE 
        WHEN Total_Income <= 5000 THEN 'Low'
        WHEN Total_Income BETWEEN 5001 AND 10000 THEN 'Medium'
        WHEN Total_Income BETWEEN 10001 AND 25000 THEN 'High'
        ELSE 'Very High'
    END AS income_segment
    FROM loan_data
)
SELECT income_segment,
COUNT(*) AS total_applicants,
SUM(Loan_Approved) AS approved,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM income_segments
GROUP BY income_segment
ORDER BY approval_rate DESC;

-- Q8: Self Employed vs Salaried applicants
-- Comparing loan approval patterns between employment types
USE loan_analysis;
SELECT Self_Employed,
COUNT(*) AS total_applicants,
ROUND(AVG(Total_Income), 2) AS avg_income,
ROUND(AVG(LoanAmount), 2) AS avg_loan_amount,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY Self_Employed;

-- Q9: Impact of marital status on loan approval
-- Analyzing if being married affects loan approval chances
USE loan_analysis;
SELECT Married,
COUNT(*) AS total_applicants,
ROUND(AVG(Total_Income), 2) AS avg_income,
ROUND(AVG(LoanAmount), 2) AS avg_loan_amount,
ROUND(SUM(Loan_Approved) * 100.0 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY Married;

-- Q10: Top 3 highest loan amounts in each property area
-- Using Window Function RANK() with PARTITION BY
USE loan_analysis;
WITH ranked_loans AS (
    SELECT 
    Property_Area,
    Gender,
    LoanAmount,
    Total_Income,
    Loan_Status,
    RANK() OVER (PARTITION BY Property_Area ORDER BY LoanAmount DESC) AS loan_rank
    FROM loan_data
)
SELECT * FROM ranked_loans
WHERE loan_rank <= 3;