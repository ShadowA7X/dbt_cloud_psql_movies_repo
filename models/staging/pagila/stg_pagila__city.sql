{% set source_table = source('pagila', 'city') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        city_id,
        city,
        country_id,
        last_update
    from source

)

select * 
from renamed
