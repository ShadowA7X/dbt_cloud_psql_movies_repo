{% set source_table = source('pagila', 'customer') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        customer_id,
        store_id,
        first_name,
        last_name,
        email,
        address_id,
        activebool,
        create_date,
        last_update,
        active
    from source

)

select * 
from renamed
