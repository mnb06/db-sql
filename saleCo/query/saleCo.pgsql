--a
--SELECT count(*) from  invoice

--b
/*SELECT count(*) from  invoice
WHERE inv_date BETWEEN '2010-01-14'AND '2010-01-16' 
*/

--c
/*SELECT count(*) from customer
WHERE customer.cus_balance > 500 
*/

--d
/*SELECT DISTINCT c.cus_code, i.inv_number, i.inv_date, p.p_descript, l.line_units, p.p_price
FROM customer c INNER JOIN invoice i ON c.cus_code = i.cus_code
                            INNER JOIN line l on i.inv_number = l.inv_number
                                INNER JOIN product p on l.p_code = p.p_code
*/

--e
/*SELECT c.cus_code, i.inv_number, p.p_descript, l.line_units, p.p_price, (l.line_price*l.line_units) as subtotal
FROM customer c INNER JOIN invoice i ON c.cus_code = i.cus_code
                            INNER JOIN line l on i.inv_number = l.inv_number
                                INNER JOIN product p on l.p_code = p.p_code
*/

--f
/*SELECT c.cus_code, c.cus_balance, sum(l.line_price * l.line_units) as facturado
FROM customer c, invoice i, line l
WHERE c.cus_code = i.cus_code
AND i.inv_number = l.inv_number
GROUP BY c.cus_code
*/

--g
/*SELECT c.cus_code, c.cus_balance, sum(l.line_price * l.line_units) as facturado, count(l) as compras_ind
FROM customer c, invoice i, line l
WHERE c.cus_code = i.cus_code
AND i.inv_number = l.inv_number
GROUP BY c.cus_code
*/

--h
/*SELECT DISTINCT c.cus_code, c.cus_balance
FROM customer c, invoice i 
WHERE c.cus_code = i.cus_code
ORDER BY c.cus_code
*/

--i
/*SELECT DISTINCT c.cus_code, c.cus_balance
FROM customer c left join invoice i on c.cus_code = i.cus_code
where i.cus_code is NULL
;
*/

--j
/*SELECT p.p_descript, sum(l.line_units*l.line_price) as total
FROM product p LEFT JOIN line l on l.p_code = p.p_code
GROUP BY p.p_descript
*/

--k
/*CREATE VIEW ventas AS 
SELECT i.inv_number, i.inv_date, l.line_units, l.line_price, c.cus_fname, c.cus_lname, p.p_descript, v.v_name 
FROM invoice i, line l, customer c, product p, vendor v
;
*/





--https://www.youtube.com/watch?v=DXKRx91Cxqs&list=PLBfVyFgrJPTDtjUFPYKvF2dggr8oV-JkM