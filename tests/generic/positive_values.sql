{% test positive_values(model, column_name) %}


   select *
   from {{ model }}
   where {{ column_name }} < 0


{% endtest %}

-- este es un test genérico que podemos reutilizar
-- se usan en el .yaml al igual que los unique, not_null, etc