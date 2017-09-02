CREATE VIEW product_view
(id, name, price, company_id, expression, photo, category, cname, code, cdate) 
AS
	SELECT p.id, p.name, price, company_id, expression, photo, category, c.name, code,to_char(cdate,'yyyy-mm-dd') 
	FROM    product p, category c 
	WHERE  p.category = c.id;