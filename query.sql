-- look at the tables separately to identify primary and forieng key
SELECT * FROM menu_items;
SELECT * FROM order_details;

-- join the two tables while using the order_details table as the primary one
SELECT * FROM menu_items AS mi RIGHT JOIN order_details AS od ON mi.menu_item_id = od.item_id;

-- most ordered item
SELECT item_name, category ,COUNT(item_id) FROM (SELECT * FROM menu_items AS mi RIGHT JOIN order_details AS od ON mi.menu_item_id = od.item_id) AS orders
GROUP BY item_id
ORDER BY COUNT(item_id) DESC
LIMIT 1;

-- least ordered item
SELECT item_name, category ,COUNT(item_id) FROM (SELECT * FROM menu_items AS mi RIGHT JOIN order_details AS od ON mi.menu_item_id = od.item_id) AS orders
GROUP BY item_id
ORDER BY COUNT(item_id)
LIMIT 1;

-- highest spend order
SELECT order_id, SUM(price) FROM menu_items AS mi RIGHT JOIN order_details AS od ON mi.menu_item_id = od.item_id
GROUP BY order_id
ORDER BY SUM(price) DESC
LIMIT 1;

-- most ordered category in the highest spend order
SELECT category, COUNT(item_id) FROM menu_items AS mi RIGHT JOIN order_details AS od ON mi.menu_item_id = od.item_id
WHERE order_id = 440
GROUP BY category
ORDER BY COUNT(item_id) DESC
LIMIT 1;