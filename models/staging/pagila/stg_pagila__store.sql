{% set source_table = source('pagila', 'store') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        store_id,
        manager_staff_id,
        address_id,
        last_update
    from source

)

select * 
from renamed
