{% set source_table = source('pagila', 'category') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        category_id,
        name,
        last_update
    from source

)

select * 
from renamed
