with 

source as (

    select * from {{ source('_sql_server_sources', 'users') }}

),

renamed as (

    select
        user_id,
        updated_at,
        address_id,
        last_name,
        created_at,
        phone_number,
        total_orders,
        first_name,
        email,
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false