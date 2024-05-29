with 

source as (

    select * from {{ source('_sql_server_sources', 'orders') }}

),

renamed as (

    select
        order_id,
        shipping_service,
        shipping_cost,
        address_id,
        created_at AS order_placed_date,
        case 
            WHEN TRIM(promo_id) = '' then 'no_promo'
            else promo_id
        end AS promo_name,
        md5(promo_id) AS promo_id, -- esta creando los mismos hash que en promos. 
                                    --a los espacios en blanco les estacreando otro hash
        estimated_delivery_at,
        order_cost,
        user_id,
        order_total,
        delivered_at AS delivery_date ,
        tracking_id,
        status,
        COALESCE(_fivetran_deleted, false) AS _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
where _fivetran_deleted = false