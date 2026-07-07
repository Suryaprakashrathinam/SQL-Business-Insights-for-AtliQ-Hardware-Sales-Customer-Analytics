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
