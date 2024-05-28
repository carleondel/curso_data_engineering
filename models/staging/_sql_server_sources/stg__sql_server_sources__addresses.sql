with 

source as (

    select * from {{ source('_sql_server_sources', 'addresses') }}

),

renamed as (

    select
        address_id,
        zipcode,
        country,
        address,
        state,
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false