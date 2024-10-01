SELECT 
	ord.order_id,
	CONCAT(c.first_name,' ',c.last_name) AS 'Customers',
	c.city, 
	c.state,
	ord.order_date,
	YEAR(ord.order_date) AS 'Year',
	SUM(oi.quantity) AS 'Total units',
	SUM(oi.quantity * oi.list_price) AS 'Revenue',
	p.product_name,
	cat.category_name,
	br.brand_name,
	st.store_name,
	CONCAT(staff.first_name,' ',staff.last_name) AS 'Sales rep'
FROM sales.orders ord
JOIN sales.customers c ON ord.customer_id = c.customer_id
JOIN Sales.order_items oi ON ord.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
JOIN production.categories cat ON p.category_id	= cat.category_id
JOIN sales.stores st ON ord.store_id = st.store_id
JOIN sales.staffs staff ON ord.staff_id = staff.staff_id
JOIN production.brands br ON p.brand_id = br.brand_id
GROUP BY 
	ord.order_id, 
	CONCAT(c.first_name,' ',c.last_name),
	c.city,
	c.state,
	ord.order_date,
	p.product_name,
	category_name,
	st.store_name,
	CONCAT(staff.first_name,' ',staff.last_name),
	br.brand_name