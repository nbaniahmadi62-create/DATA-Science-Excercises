/* subquery
 #1 result Type : scalar subquery , Row subquery , Table subquery */
  use SalesDB
  -- scalar subquery
  select 
  *
  FROM Sales.Customers
-- return single value 
  select 
  COUNT(Score)
  FROM Sales.Customers

-- Row subquery 
select 
  CustomerID
  FROM Sales.Customers
  --return  multiplerows

  --Table subquery
  select 
  FirstName,
  LastName,
  Country
  FROM Sales.Customers
  -- return table query


  /* #2 location| clouses:
  SELECT , FROM , JOIN , WHERE  */ 

-- subquery in FROM clauses
  --fined the product that have a price higher than the average price of all products
SELECT * --main query
FROM  --subquery 
     (select   
       *,
        AVG(Price) OVER() avgprice
        from Sales.Products
      )t
WHERE  Price  > avgprice

 -- Rank customers based on their total amount of sales

SELECT * from sales.Customers
SELECT * from sales.Orders

select  --main query
 *,  
rank() over( ORDER BY totalsales DESC) rankshow
 from  -- subquery
         (select  
          CustomerID,
          sum(sales)   totalsales
          FROM Sales.Orders
          GROUP BY CustomerID
         )sub

-- subquery in SELECT clauses
/* show the productIDs , names, prices and total number of orders.*/
SELECT * from sales.Products
select  productID,
        Product,
        price,
       ( select 
        count(OrderID)  totalnumber
        FROM Sales.Orders
       )
        
FROM Sales.Products

-- subquery in JOIN clauses
/* show all customer details and 
find the total sales  for each customers*/

SELECT * from sales.Orders


SELECT
 * 
from sales.Customers  m  --main query
left JOIN (
       SELECT CustomerID,
       SUM(Sales)  totalsales
       from sales.Orders
       GROUP BY CustomerID
       )s
ON s.CustomerID = m.CustomerID

-- subquery in WHERE clauses
/* Find the products that have a price higher than 
the average price of all products .*/
select 
* ,
(select AVG(price) from Sales.Products) avg_price
FROM Sales.Products mainq
WHERE mainq.Price > (
                     select 
                     AVG(price) avg_price
                    from Sales.Products
                    )


-- subquery in WHERE clauses in operator 
/* show the details of orders made by customers in Germany*/ 

select  
* 
from  sales.Orders
where CustomerID IN (
         select  
           CustomerID 
        from  sales.Customers
        where Country = 'Germany'
        )

/* show thw details of orders fo customers 
who are not from Germany */
select  
* 
from  sales.Orders
where CustomerID not IN (
         select  
           CustomerID 
        from  sales.Customers
        where Country = 'Germany'
        )

-- subquery in WHERE clauses any / all  operator 
/* fimd female employees whose salaries are greater than 
 the salaries of any male employees    */

 select 
*
 from Sales.Employees
 WHERE Gender = 'F'  and 
     Salary > any  
     (      select 
                Salary
            from Sales.Employees
             WHERE Gender = 'M'
        )

 select * from Sales.Employees  WHERE Gender = 'M'
/* fimd female employees whose salaries are greater than 
 the salaries of all male employees    */
 select 
*
 from Sales.Employees
 WHERE Gender = 'F'  and 
     Salary > ALL  
     (      select 
                Salary
            from Sales.Employees
             WHERE Gender = 'M'
        )
 -- #3 Dependency :
 -- NON-Correlated  , Correlated subquery
 /* show all customer details and
 find the total order for each customer   */
 SELECT 
 * ,
  (SELECT  --correlated query
   COUNT(*)
   FROM  Sales.Orders  o
   WHERE o.CustomerID = c.CustomerID
   )  totalsales2

 FROM  Sales.Customers c 

 
 -- subquery in WHERE clauses EXISTS operator 
/* show the details of orders made by customers in Germany   */
select * 
from  Sales.Orders  o 
where  EXISTS ( select *
             from Sales.Customers c
             WHERE Country = 'Germany'
             AND o.CustomerID = c.CustomerID )
 

/* show the details of orders made by customers not in Germany   */
select * 
from  Sales.Orders  o 
where not EXISTS ( select *
             from Sales.Customers c
             WHERE Country = 'Germany'
             AND o.CustomerID = c.CustomerID )
