with 

source as (

    select * from {{ source('_sql_server_sources', 'users') }}

),

renamed as (

    select
        user_id,
        CONVERT_TIMEZONE('UTC', updated_at) AS updated_at_UTC,
        address_id,
        last_name,
        CONVERT_TIMEZONE('UTC', created_at) AS created_at_UTC,
        phone_number,
        total_orders,
        first_name,
        email,
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        CONVERT_TIMEZONE('UTC', _fivetran_synced) AS _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false