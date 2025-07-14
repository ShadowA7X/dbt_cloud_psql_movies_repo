{% set source_table = source('pagila', 'staff') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        staff_id,
        first_name,
        last_name,
        address_id,
        email,
        store_id,
        active,
        username,
        password,
        last_update,
        picture
    from source

)

select * 
from renamed
