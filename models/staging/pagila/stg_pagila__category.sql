with source as (

    select * 
    from {{ source('pagila', 'category') }}

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
