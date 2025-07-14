{% set source_table = source('pagila', 'film_category') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        film_id,
        category_id,
        last_update
    from source

)

select * 
from renamed
