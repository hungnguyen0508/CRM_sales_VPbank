with category as(
select sum(prod_ca) as prod_ca, 
	   sum(prod_td) as prod_td,
	   sum(prod_credit_card) as prod_credit_card,
	   sum(prod_app) as prod_app,
	   sum(prod_secured_loan) as prod_secured_loan,
	   sum(prod_upl) as prod_upl
from prod_holding) 
SELECT 'prod_ca' AS product_name, prod_ca AS count FROM category
UNION ALL
SELECT 'prod_td' AS product_name, prod_td AS count FROM category
UNION ALL
SELECT 'prod_credit_card' AS product_name, prod_credit_card AS count FROM category
UNION ALL
SELECT 'prod_app' AS product_name, prod_app AS count FROM category
UNION ALL
SELECT 'prod_secured_loan' AS product_name, prod_secured_loan AS count FROM category
UNION ALL
SELECT 'prod_upl' AS product_name, prod_upl AS count FROM category;
	   
with a as (select customer_id,
	   prod_ca,
	   prod_td,
	   prod_credit_card,
	   prod_app,
	   prod_secured_loan,
	   prod_upl,
 	   case when prod_ca=1 then 1 else '' end as first,
 	   case when prod_td=1 then 2 else '' end as second,
 	   case when prod_credit_card=1 then 3 else '' end as third,
 	   case when prod_app=1 then 4 else '' end as fourth,
 	   case when prod_secured_loan=1 then 5 else '' end as fifth,
 	   case when prod_upl=1 then 6 else '' end as sixth   
from prod_holding)
select customer_id, 
       concat(first,second,third,fourth,fifth,sixth) as combo_used
from a 