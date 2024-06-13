with 

source as (

    select * from {{ source('_sql_server_sources', 'order_items') }}

),

renamed as (

    select
        order_id,
        product_id,
        quantity,
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        CONVERT_TIMEZONE('UTC',_fivetran_synced) AS _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false 