1

-----

Write a query that shows all the information about all the salespeople in
the database. Use a basic SELECT query.

-----

SELECT * FROM salespeople


==========
2

-----

Write a query that shows all the information about all salespeople from
the 'Northwest' region.

-----

SELECT * FROM salespeople WHERE region='Northwest';


==========
3

-----

Write a query that shows just the emails of the salespeople from the
'Southwest' region.

-----

SELECT email FROM salespeople WHERE region='Southwest';


==========
4

-----

Write a query that shows the given name, surname, and email of all
salespeople in the 'Northwest' region.

-----

SELECT givenname, surname, email FROM salespeople WHERE region='Northwest';


==========
5

-----

Write a query that shows the common name of melons that cost more than
$5.00.

-----

SELECT common_name FROM melons WHERE price > 5;


==========
6

-----

Write a query that shows the melon type and common name for all
watermelons that cost more than $5.00.


-----

SELECT melon_type, common_name FROM melons WHERE melon_type='Watermelon' AND price >5;


==========
7

-----

Write a query that displays all common names of melons that start with
the letter 'C'.


-----

SELECT common_name FROM melons WHERE common_name LIKE 'C%';


==========
8

-----

Write a query that shows the common name of any melon with 'Golden'
anywhere in the common name.


-----

SELECT common_name FROM melons WHERE common_name LIKE '%Golden%';


==========
9

-----

Write a query that shows all the distinct regions that a salesperson can belong to.


-----

SELECT DISTINCT region FROM salespeople;


==========
10

-----

Write a query that shows the emails of all salespeople from both the
Northwest and Southwest regions.


-----

SELECT email FROM salespeople WHERE region='Northwest' OR region='Southwest';


==========
11

-----

Write a query that shows the emails of all salespeople from both the
Northwest and Southwest regions, this time using an 'IN' clause.  


-----

SELECT email FROM salespeople WHERE region IN ('Northwest', 'Southwest');


==========
12

-----

Write a query that shows the email, given name, and surname of all
salespeople in either the Northwest or Southwest regions whose surnames start
with the letter 'M'.

-----

SELECT email, givenname, surname FROM salespeople WHERE region IN('Northwest', 'Southwest') AND surname LIKE 'M%';


==========
13

-----

Write a query that shows the melon type, common name, price, and the
price of the melon given in euros. The 'melons' table has prices in dollars,
and the dollar to euro conversion rate is 0.735693.


-----

SELECT melon_type, common_name, price, price*0.735693 AS price_eur FROM melons;


==========
14

-----

Write a query that shows the total number of customers in our customer
table.

-----

SELECT count(id) FROM customers;


==========
15

-----

Write a query that counts the number of orders shipped to California.

-----

SELECT count(id) FROM orders WHERE shipto_state = 'CA';


==========
16

-----

Write a query that shows the total amount of money spent across all melon
orders.

-----

SELECT sum(order_total) FROM orders;


==========
17

-----

Write a query that shows the average order cost.

-----

SELECT AVG(order_total) FROM orders;


==========
18

-----

Write a query that shows the order total that was lowest in price.

-----

SELECT min(order_total) FROM orders;


==========
19

-----

Write a query that fetches the id of the customer whose email is 
'phyllis@demizz.edu'.

-----

SELECT id FROM customers WHERE email='phyllis@demizz.edu';


==========
20

-----

Write a query that shows the id, status and order_total for all orders 
made by customer 100.

-----

SELECT id, status, order_total FROM orders WHERE customer_id=100;


==========
21

-----

Write a single query that shows the id, status, and order total for all
orders made by 'phyllis@demizz.edu'. Use a subselect to do this.


-----

SELECT orders.id, orders.status, orders.order_total FROM orders WHERE orders.customer_id=(SELECT customers.id FROM customers WHERE customers.email = 'phyllis@demizz.edu');


==========
22

-----

Write a query that shows the id, status, and order total for all orders
made by 'phyllis@demizz.edu'. Use a join to do this.

-----

SELECT orders.id, orders.status, orders.order_total FROM orders JOIN customers ON (orders.customer_id=customers.id) WHERE customers.email='phyllis@demizz.edu';


==========
23

-----

Write a query that shows all columns that were attached to order #2725.

-----

SELECT * FROM order_items WHERE order_id=2725;


==========
24

-----

Write a query that shows the common_name, melon_type, quantity,
unit_price and total_price for all the melons in order #2725.

-----

SELECT melons.common_name, melons.melon_type, order_items.quantity, order_items.unit_price, order_items.total_price FROM melons JOIN order_items ON (melons.id=order_items.melon_id) WHERE order_items.order_id=2725;


==========
25

-----

Write a query that shows the total amount of revenue that comes from
internet orders.

-----

SELECT SUM(order_total) FROM orders WHERE salesperson_id IS NULL;


==========
26

"""
Challenge: Produce a list of all salespeople and the total amount of orders
they've sold, while calculating a 15% commission on all of their orders.
Include their given name, surname, the total of all their sales, and their
commission. Only report one row per salesperson. Include salespeople who have
not made any sales.

You will need 'left join' (http://sqlzoo.net/wiki/LEFT_JOIN) and 'group by'
(http://sqlzoo.net/wiki/SELECT_.._GROUP_BY) clauses to finish this one.

"""

SELECT salespeople.givenname, salespeople.surname, sum(orders.order_total), sum(orders.order_total)*0.15 FROM salespeople LEFT JOIN orders ON (salespeople.id=orders.salesperson_id) GROUP BY salespeople.id;