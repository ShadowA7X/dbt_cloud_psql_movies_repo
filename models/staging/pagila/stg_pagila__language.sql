with source as (

    select * 
    from {{ source('pagila', 'language') }}

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
