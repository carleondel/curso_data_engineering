with 

source as (

    select * from {{ source('_sql_server_sources', 'promos') }}

),

renamed as (

    select
        md5(cast(promo_id as text)) AS promo_id,
        promo_id AS description,
        discount AS discount_total_euros,
        status,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
