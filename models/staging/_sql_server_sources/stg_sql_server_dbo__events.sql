with 

source as (

    select * from {{ source('_sql_server_sources', 'events') }}

),

renamed as (

    select
        event_id,
        page_url,
        event_type,
        user_id,
        product_id,
        session_id,
        created_at,
        order_id,
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        CONVERT_TIMEZONE('UTC',_fivetran_synced) AS _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false