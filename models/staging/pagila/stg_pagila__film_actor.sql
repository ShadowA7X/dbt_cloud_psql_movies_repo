{% set source_table = source('pagila', 'film_actor') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        actor_id,
        film_id,
        last_update
    from source

)

select * 
from renamed
