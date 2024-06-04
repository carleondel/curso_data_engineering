select 
    0 AS status_id,
    'preparing' AS status_name
UNION ALL
select 
    1 AS status_id,
    'shipped' AS status_name
UNION ALL
select 
    2 AS status_id,
    'delivered' AS status_name
/*esta tabla es interesante para simplificar
 las consultas despues de la tabla orders*/