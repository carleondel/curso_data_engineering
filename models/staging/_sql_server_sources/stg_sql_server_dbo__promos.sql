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
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        -- esto lo usaremos para filtrar mas adelante
        -- y usar un where para quedarnos solo con los datos 
        -- actuales
        CONVERT_TIMEZONE('UTC',_fivetran_synced) AS _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false
