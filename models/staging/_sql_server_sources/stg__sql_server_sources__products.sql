with 

source as (

    select * from {{ source('_sql_server_sources', 'products') }}

),

renamed as (

    select
        product_id,
        price,
        name,
        inventory,
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false