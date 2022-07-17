#Total profit of store 4 for March
SELECT SUM(Price) AS TotalSalesMarchStore4
FROM `mydb`.`product availability`
WHERE ProductID IN(
	SELECT ProductID
    FROM `mydb`.`sales tracking`
    WHERE StoreID = 4 AND Date LIKE'3%'
	GROUP BY StoreID
);

#Total profit of all stores
SELECT SUM(PRICE) AS TotalProfitOfAllStores
FROM `mydb`.`sales tracking` AS ST
JOIN `mydb`.`product availability` AS PA ON ST.ProductID = PA.ProductID; 

#Total products that are black
Select *
FROM `mydb`.`product availability`
Where Color = 'Black';

#Products that above $30 and a size small
Select *
FROM `mydb`.`product availability`
Where Price >= 30 AND Size = 'Small';

#Most popular store
Select StoreID, Count(TransactionID) AS Transactions
FROM `mydb`.`sales tracking`
Group by StoreID
Order by Transactions DESC;

#List of all products and their prices
Select ProductID, ProductName, Size, Price
From `mydb`.`product availability`
Group by ProductID
Order by Price DESC;

#Most popular product and store it is sold in
SELECT ProductName, Price, StoreID, COUNT(ProductName) AS NumberOfProducts
FROM `mydb`.`product availability` AS PA
JOIN `mydb`.`sales tracking` AS ST ON PA.ProductID = ST.ProductID
GROUP BY StoreID
ORDER BY NumberOfProducts DESC, StoreID;

#List of stores located in Atlanta
SELECT *
FROM `mydb`.`store location`
WHERE City='Atlanta';