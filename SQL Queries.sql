-- 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.
select distinct market from dim_customer where region='APAC' and customer='Atliq Exclusive'

-- 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg
with unique_products as 
(select
	fiscal_year,
    count(distinct product_code) as unique_products
from fact_gross_price
group by fiscal_year)
select
	up_2020.unique_products as unique_products_2020,
    up_2021.unique_products as unique_products_2021,
    round((up_2021.unique_products - up_2020.unique_products)/up_2020.unique_products*100,2) as pct_change
from unique_products up_2020
cross join unique_products up_2021
where up_2020.fiscal_year=2020 and up_2021.fiscal_year=2021

-- 3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields, segment product_count
select
	segment,
    count(*) as product_count
from dim_product
group by segment order by product_count desc

-- 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment product_count_2020 product_count_2021 difference
with temp_table as 
(select
	p.segment,
    s.fiscal_year,
    count(distinct s.product_code) as product_count
from fact_sales_monthly s
join dim_product p on s.product_code = p.product_code
group by p.segment, s.fiscal_year)
select
	up_2020.segment,
    up_2020.product_count as product_cnt_2020,
    up_2021.product_count as product_cnt_2021,
    up_2021.product_count - up_2020.product_count as difference
from temp_table as up_2020 join temp_table as up_2021 
on up_2020.segment = up_2021.segment and up_2020.fiscal_year=2020 and up_2021.fiscal_year=2021 
order by difference desc

-- 5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, product_code product manufacturing_cost
select
	mc.product_code,
    concat(product, "(",variant,")") as product,
    cost_year,
    manufacturing_cost
from fact_manufacturing_cost mc
join dim_product p
on p.product_code = mc.product_code
where manufacturing_cost in 
((select min(manufacturing_cost) from fact_manufacturing_cost),
 (select max(manufacturing_cost) from fact_manufacturing_cost))
 
 -- 6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
 -- The final output contains these fields, customer_code customer average_discount_percentage
 select
	c.customer_code,
    c.customer,
    round(avg (pre_invoice_discount_pct)*100,2) as average_discount_percentage
from fact_pre_invoice_deductions d
join dim_customer c on c.customer_code=d.customer_code
where c.market='India' and fiscal_year='2021'
group by c.customer_code, c.customer
order by average_discount_percentage desc
limit 5

-- 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions. The final report contains these columns: Month Year Gross sales Amount
with temp_table as 
(select
	customer,
    monthname(date) as month,
    month(date) as month_number,
    year(date) as year,
    (sold_quantity*gross_price) as gross_sales
from fact_sales_monthly fsm
join fact_gross_price fgp on fgp.product_code=fsm.product_code and fgp.fiscal_year=fsm.fiscal_year
join dim_customer c on c.customer_code=fsm.customer_code
where customer='Atliq Exclusive')
select 
	month,
    year,
    concat(round(sum(gross_sales)/100000,2),"M") as gross_sales from temp_table
    group by year,month,month_number
    order by year,month_number
    
-- 8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, Quarter total_sold_quantity
with temp_table as 
(select*,
case 
when month(fsm.date) in (9,10,11) then "Q1"
when month(fsm.date) in (12,1,2) then "Q2"
when month(fsm.date) in (3,4,5) then "Q3"
else "Q4"
end as Quarter
from fact_sales_monthly fsm
where fiscal_year=2020)
select
	Quarter,
    sum(sold_quantity) as total_sold_quantity
from temp_table
group by Quarter
order by total_sold_quantity desc

-- 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields, channel gross_sales_mln percentage
with temp_table as (
select
	c.channel,
    round(sum(fsm.sold_quantity*fgp.gross_price)/1000000,2) as gross_sales_in_million
from dim_customer c
join fact_sales_monthly fsm
	on c.customer_code=fsm.customer_code
join fact_gross_price fgp
	on fsm.product_code=fgp.product_code and fsm.fiscal_year=fgp.fiscal_year where fsm.fiscal_year=2021
group by channel
order by gross_sales_in_million desc)
select *,
	concat(round(gross_sales_in_million*100/sum(gross_sales_in_million) over (),2),'%') as percentage
from temp_table
    
-- 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields, division product_code, product total_sold_quantity rank_order
with product_sales as (
select
	p.division,
    fsm.product_code,
    concat(p.product,'(',p.variant,')') as product,
    sum(sold_quantity) as total_sold_quantity,
    dense_rank () over (partition by division order by sum(sold_quantity) desc) as rank_order
from fact_sales_monthly fsm
join dim_product p on fsm.product_code=p.product_code where fiscal_year=2021
group by 
	p.division,
    fsm.product_code,
    p.product,
    p.variant)
select * from product_sales
where rank_order <=3
order by division, rank_order
