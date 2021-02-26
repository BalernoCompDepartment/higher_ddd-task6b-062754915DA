/* do not change the following two lines! */
.header on
.mode column
/* do not change the above two lines! */


/*Task One: List the name of each product included in order 20006 with its price and the quantity ordered. The order number and total cost of each item should be shown.*/

SELECT product.name, product.price, orderProduct.quantity, orderProduct.orderNumber
FROM product, orderProduct
WHERE product.productID = orderProduct.productID AND orderProduct.orderNumber = "20006" ;

/*Task Two: List all of the products supplied by the supplier called ‘Fun and Games’. The listing should show the name of each product together with its price and discounted price (Fun and Games plans to offer a seasonal discount of 10% on all of its products). */

SELECT product.name, product.price, (product.price * 0.9) AS "Discounted price"
FROM supplier, product
WHERE supplier.supplierID = product.supplierID AND supplier.name = "Fun and Games" ;

/*Task Three: List each of the products included in order 20007 with its productID and quantity ordered. The query should show the increased quantity should the customer increase the quantity of all ‘bean bag’ products in the order by 20. */

/*the last part is using a LIKE '%bean bags%' tp choose any product with bena bag in the descitption it goes in the where */

/* the only reason it is not working is you are looking for productID 20007 and it is orderNumber 20007*/

SELECT product.name, product.productID, orderProduct.quantity, (orderProduct.quantity + 20) AS "Bean bags +20"
FROM product, orderProduct
WHERE product.productID = orderProduct.productID 

AND orderproduct.orderNumber = 20007 /* This is the bit I fixed for you */

AND product.description LIKE "%bean bag%" ;

/*Task Four: The shop called ‘The Toy Store’ wants to increase the number of each type of bean bag in its order by 25.*/

SELECT product.name, customer.shopName, customer.contactName, product.price, product.description, orderProduct.quantity, (orderProduct.quantity + 25) AS "Bean bags +25"
FROM product, orderProduct, customer, customerOrder
WHERE product.productID = orderProduct.productID AND orderProduct.orderNumber = customerOrder.orderNumber AND customerOrder.customerID =  customer.customerID AND product.description LIKE "%bean bag%" AND customer.shopName LIKE "%The Toy Store%" ; 

/*Use a query to list the name of the shop with the name of its contact person, the original quantity, price, description and the updated quantity of all bean bags in the order. */
