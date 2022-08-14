# SQL Query Demo

# 1. List all people working in shop 101
SELECT id
FROM staff_emp
WHERE shop_id = 101
;

# 2. List of shops that carries GreenTea Boba
SELECT s.*
FROM shop s
JOIN shop_boba sb ON s.id = sb.shop_id
JOIN bobatea b ON sb.boba_id = b.id
WHERE b.descript = 'GreenTea Boba'
;

# 3. List of customers that bought GreenTea Boba
SELECT c.*
FROM customer c
JOIN cust_trans ct ON c.id = ct.cust_id
JOIN transactions t ON ct.trans_id = t.id
JOIN bobatea b ON t.tea_id = b.id
WHERE b.descript = 'GreenTea Boba'
;

# 4. List of customers who purchased more than one
SELECT c.*, COUNT(ct.cust_id) as 'How Many?'
FROM customer c
JOIN cust_trans ct ON c.id = ct.cust_id
JOIN transactions t ON ct.trans_id = t.id
JOIN bobatea b ON t.tea_id = b.id
GROUP BY c.id
HAVING COUNT(ct.cust_id) > 1
;

#5 List all the staff who works in the shop with inventory amount more than 90
SELECT DISTINCT staff_emp.id
FROM staff_emp
JOIN inventory ON staff_emp.shop_id = inventory.shop_id
WHERE inventory.amount > 90
;
