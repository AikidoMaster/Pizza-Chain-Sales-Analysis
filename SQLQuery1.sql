--view the data
SELECT * FROM pizza_sales;

--Total Revenue: the sum of total price of all pizza orders.
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

--Average order value: The average amount spent per order, calculated by divided the total revenue by the number of cost
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizza_sales;

--Total Pizza Sold: The sum of the quantities of all pizzas sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

--Total Ords: The total number of orders placed.
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

--Average Pizza Per Order: The average number of pizzas sold per order,calcualated by dividing the total number of pizzas sold by the total number of orders
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales;

-- Daily Trends for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Monthly Trends for Total order
SELECT DATENAME(MONTH, order_date) AS Month_Name , COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC

--Percentage  of sales by Pizza Category
SELECT pizza_category, SUM(total_price) AS Total_Sales,SUM(total_price)  * 100 /
(SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage
FROM pizza_sales 
GROUP BY pizza_category;

-- Percentage of Sales of Pizza Size
SELECT pizza_size, SUM(total_price) AS Total_Sales,SUM(total_price)  * 100 /
(SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY Total_Sales_Percentage DESC

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC 

--Top 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC 

--Bottom 5 Pizza by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Top 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC 

--Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--Top 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Pizza  by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
