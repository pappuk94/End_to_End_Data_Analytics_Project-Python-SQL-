select * from df_orders;

-- 1. Find top 10 highest revenue generating products.
select product_id, sum(sale_price) total_revenue
from df_orders
group by product_id
order by total_revenue desc limit 10;

-- 2. Find top 5 highest selling product in each region.
with cte as
	(select region, product_id, sum(sale_price) total_sales,
	row_number() over(partition by region order by sum(sale_price) desc) rn
	from df_orders
	group by region, product_id)
select region, product_id, total_sales
from cte 
where rn < 6;

-- 3. Find month over month growth comparision for 2020 and 2023 sales, e.g. jan 2022 vs jan 2023.
with cte as
	(select order_date, sale_price "sales", year(order_date) "year", month(order_date) month_no, 
    monthname(order_date) "month" 
	from df_orders)
select month,
sum(case when year = 2022 then sales end) "year_2022", 
sum(case when year = 2023 then sales end) "year_2023"
from cte
group by `month`
order by month_no;

-- 4. Find which month has highest sales for each category.
with cte as
	(select category, year(order_date) "year", monthname(order_date) "month", sum(sale_price) total_sales,
    row_number() over(partition by category order by sum(sale_price) desc) rn
	from df_orders
	group by category, year(order_date), month(order_date))
select category, year, month
from cte
where rn = 1;

-- 5. Which sub-category has highest growth by profit in 2023 compare to 2022.
with cte as
		(select sub_category,
		sum(case when year(order_date) = 2022 then profit end) as profit_2022,
		sum(case when year(order_date) = 2023 then profit end) as profit_2023
		from df_orders
		group by sub_category),
	cte2 as
		(select *, (profit_2023-profit_2022)*100/profit_2022 as growth
        from cte)
select * from cte2
order by growth desc limit 1;

-- 6. Find what percent of total quantity is contributed by each sub-category within each category
with cte as
	(select category, sub_category, sum(quantity) "subcategory_quantity",
	sum(sum(quantity)) over(partition by category) "category_quantity"
	from df_orders
	group by category, sub_category)
select category, sub_category,
round((subcategory_quantity*100)/category_quantity,2) as sub_category_quant_contribution
from cte;

    
    