{% set source_table = source('pagila', 'inventory') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        inventory_id,
        film_id,
        store_id,
        last_update
    from source

)

select * 
from renamed
