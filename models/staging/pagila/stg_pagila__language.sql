{% set source_table = source('pagila', 'language') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        language_id,
        name,
        last_update
    from source

)

select * 
from renamed
