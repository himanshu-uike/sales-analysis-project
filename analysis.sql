-- =====================================
-- SALES ANALYSIS PROJECT (SQL)
-- Objective: Analyze sales and profit to identify business insights
-- =====================================


-- 1. Total Sales and Profit
select 
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit 
from orders;
-- Insight:
-- The business generated ~2.3M in sales with ~292K profit,
-- indicating overall profitability but scope for optimization.



-- 2. Sales and Profit by Category
select 
    category,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit 
from orders 
group by category;
-- Insight:
-- The Technology category generates the highest sales and profit, indicating strong performance and high-margin products.
-- While Furniture has comparable sales, it contributes significantly lower profit, suggesting pricing inefficiencies or high discounting.
-- Office Supplies maintains a balanced performance with moderate sales and stable profitability.



-- 3. Loss-making Sub-Categories
select 
    Sub_Category,
    round(sum(profit),2) as total_profit 
from orders 
group by sub_category 
order by total_profit asc 
limit 5;
-- Insight:
-- Tables, Bookcases, and Supplies are the most loss-making sub-categories, with Tables contributing the highest loss.
-- This indicates potential issues such as excessive discounting, high costs, or inefficient pricing strategies.
-- These categories require immediate attention to reduce losses and improve overall profitability.



-- 4. Discount Impact on Profit
select 
    discount, 
    round(avg(profit),2) as avg_profit 
from orders 
group by discount 
order by discount;
-- Insight:
-- Discounts above 20% lead to negative average profit, indicating that excessive discounting is a major cause of losses.
-- While moderate discounts (up to 20%) maintain profitability, higher discounts significantly reduce margins and result in losses.
-- This suggests that the current discounting strategy is inefficient and should be optimized to improve overall profitability.



-- 5. Region-wise Performance
select 
    region, 
    round(sum(sales),2) as total_sales, 
    round(sum(profit),2) as total_profit 
from orders 
group by region;
-- Insight:
-- The West region generates the highest sales and profit, indicating strong market performance and growth potential.
-- The South region contributes the lowest sales, suggesting weaker market penetration or demand.
-- Additionally, the Central region shows relatively lower profitability despite moderate sales, indicating possible inefficiencies or higher costs.
-- These insights suggest focusing on expanding high-performing regions like the West while improving performance in underperforming regions such as the South and Central.

