# 📊 SQL Business Insights for AtliQ Hardware
A SQL-based business analytics project on a fictional B2B computer hardware manufacturer, completed as part of the Codebasics SQL Resume Challenge.

Link to the [Challenge](https://codebasics.io/challenges/codebasics-resume-project-challenge/7)

## 📌 Project Overview
AtliQ Hardware is a fictional B2B computer hardware company that wanted to leverage data-driven insights to improve business decision-making. This project focuses on solving real-world business problems using SQL by analyzing sales, customer, product, manufacturing, and finance data.

The objective was to answer business questions through efficient SQL queries and generate insights that support strategic decisions.

## 🎯 Business Objective
The management team wanted quick and meaningful insights into their business operations to support decisions related to:

- Sales performance
- Customer behavior
- Product portfolio
- Manufacturing costs
- Discount strategies
- Channel contribution
- Market expansion

## 🗂️ Dataset
| Table                         | Description                                                           |
| ----------------------------- | --------------------------------------------------------------------- |
| `dim_customer`                | Customer information, market, region, and sales channel               |
| `dim_product`                 | Product hierarchy including division, segment, category, and variants |
| `fact_sales_monthly`          | Monthly sales transactions                                            |
| `fact_gross_price`            | Product gross prices by fiscal year                                   |
| `fact_manufacturing_cost`     | Manufacturing costs                                                   |
| `fact_pre_invoice_deductions` | Customer discount percentages                                         |

## ❓ Business Questions Solved
1. Markets where AtliQ Exclusive operates in the APAC region.
2. Percentage increase in unique products from 2020 to 2021.
3. Product count by segment.
4. Segment with the highest increase in unique products.
5. Products with the highest and lowest manufacturing costs.
6. Top 5 customers receiving the highest average pre-invoice discounts in India.
7. Monthly gross sales report for AtliQ Exclusive.
8. Quarter with the highest total sold quantity in FY2020.
9. Sales channel contribution to gross sales in FY2021.
10. Top 3 products by division based on total sold quantity.

## 🛠️ SQL Concepts Used
- SELECT Statements
- WHERE & ORDER BY
- GROUP BY & HAVING
- INNER JOIN
- Aggregate Functions
- CASE Statements
- Common Table Expressions (CTEs)
- Window Functions (RANK(), DENSE_RANK())
- Subqueries
- Date Functions
- Filtering & Sorting

## 📈 Key Insights
- AtliQ Exclusive operates across 8 APAC markets.
- Unique products increased by 36.33% from 2020 to 2021.
- Accessories recorded the highest increase in unique products.
- Manufacturing costs varied significantly across products, highlighting pricing opportunities.
- Retailer channel contributed over 73% of gross sales in FY2021.
- Identified the top-performing products within each business division.
- Analyzed customer discount trends to identify high-discount customers in the Indian market.

## 📸 Project Screenshots
| Analysis                 | Screenshot            |
| ------------------------ | --------------------- |
| Markets in APAC          | <img width="1427" height="829" alt="t1" src="https://github.com/user-attachments/assets/fd2daa08-af21-4c81-96ac-de4b07754941" /> |
| Product Growth           | <img width="1426" height="796" alt="t2" src="https://github.com/user-attachments/assets/74c282fa-4263-46cc-9fda-73ec177d9712" /> |
| Segment Analysis         | <img width="1408" height="732" alt="t3" src="https://github.com/user-attachments/assets/efb8f2cd-fd21-4fdb-80cb-6a7e941f64d1" /> |
| Segment Growth           | <img width="1432" height="854" alt="t4" src="https://github.com/user-attachments/assets/4dde4081-546e-4500-9a71-32fdb67b270c" /> |
| Manufacturing Cost       | <img width="1442" height="845" alt="t5" src="https://github.com/user-attachments/assets/488b5d91-e46c-4619-bbc6-465f62b71674" /> |
| Customer Discounts       | <img width="1431" height="908" alt="t6" src="https://github.com/user-attachments/assets/9e7dfe8e-2c15-4230-8470-eedfb4f06e9e" /> |
| Monthly Gross Sales      | <img width="1437" height="903" alt="t7" src="https://github.com/user-attachments/assets/4a42256c-060e-4330-8092-524f62b4dc2b" /> |
| Quarterly Sales          | <img width="1443" height="887" alt="t8" src="https://github.com/user-attachments/assets/6511ec63-fea5-4427-bc31-83b6b6e90cba" /> |
| Channel Contribution     | <img width="1446" height="843" alt="t9" src="https://github.com/user-attachments/assets/33d0b7a9-a940-4513-9e25-8b03b85fcf54" /> |
| Top Products by Division | <img width="1433" height="881" alt="t10" src="https://github.com/user-attachments/assets/83eeca64-ba69-4ec8-b703-73f406704378" /> |

