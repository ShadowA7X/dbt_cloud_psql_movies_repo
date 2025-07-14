{% set source_table = source('pagila', 'film') %}

with source as (

    select * 
    from { source_table }

),

renamed as (

    select
        film_id,
        title,
        description,
        release_year,
        language_id,
        rental_duration,
        rental_rate,
        length,
        replacement_cost,
        rating,
        last_update,
        special_features,
        fulltext
    from source

)

select * 
from renamed
