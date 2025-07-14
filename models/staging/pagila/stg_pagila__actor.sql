{% set source_table = source('pagila', 'actor') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        actor_id,
        first_name,
        last_name,
        last_update
    from source

)

select * 
from renamed
