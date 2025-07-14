{% set source_table = source('pagila', 'country') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        country_id,
        country,
        last_update
    from source

)

select * 
from renamed
