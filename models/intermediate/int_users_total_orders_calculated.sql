-- AQUI QUIERO COMPLETAR EL CAMPO DE USERS TOTAL_ORDERS (TOTAL DE PEDIDOS REALIZADOS
-- POR USUARIO)
/* MATERIALIZAMOS COMO TABLA POR TENER YA TRANSFORMACIONES ALGO MAS COMPLEJAS*/
{{
  config(
    materialized='table'
  )
}}

with

    stg_orders as (select * from {{ ref("stg_sql_server_dbo__orders") }}),

    stg_users as (select * from {{ ref("stg_sql_server_dbo__users") }}),

    selection as (

        select
            a.user_id,
            a.updated_at_utc,
            a.address_id,
            a.last_name,
            a.created_at_utc,
            a.phone_number,
            count(a.user_id) as total_orders,
            a.first_name,
            a.email,
            a._fivetran_deleted,
            a._fivetran_synced

        from stg_users a
        left join stg_orders b on a.user_id = b.user_id
        group by
            a.user_id,
            a.updated_at_utc,
            a.address_id,
            a.last_name,
            a.created_at_utc,
            a.phone_number,
            a.first_name,
            a.email,
            a._fivetran_deleted,
            a._fivetran_synced

    )

select *
from selection
