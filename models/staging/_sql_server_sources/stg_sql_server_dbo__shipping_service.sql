-- AQUI QUIERO enlazar LAS DESCRIPCIONES DE SHIPPING SERVICE CON SUS ID. ESTO SERA UNA DIMENSION EN GOLD

with 

base as (

    select * from {{ ref('base_sql_server_dbo__orders_') }}

),

shipping_services_list as (

    select
        DISTINCT(shipping_service),
        shipping_service_id

    from base

)

select * from shipping_services_list