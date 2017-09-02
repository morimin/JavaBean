CREATE VIEW basket_view
(id, user_id, product_id, name, price, qty ) 
as
	SELECT p.id, b.user_id, b.product_id, p.name, price, qty 
	FROM    product p, basket b 
	WHERE  p.id = b.product_id and gubun = 'N'
/
