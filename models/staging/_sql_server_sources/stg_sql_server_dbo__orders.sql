-- AQUI QUIERO EXCLUIR LAS DESCRIPCIONES DE SHIPPING SERVICE, PROMO NAME, SHIPPING STATUS

with 

base as (

    select * from {{ ref('base_sql_server_dbo__orders_') }}

),

selection as (

    select
        order_id,
        --shipping_service,
        shipping_service_id,
        shipping_cost,
        address_id,
        order_placed_date_UTC,
        --promo_name,
        promo_id,
        estimated_delivery_at_UTC,
        order_cost,
        user_id,
        order_total,
        delivery_date_UTC,
        tracking_id,
        --shipping_status,
        shipping_status_id,
        _fivetran_deleted,
        _fivetran_synced

    from base

)

select * from selection
where _fivetran_deleted = false