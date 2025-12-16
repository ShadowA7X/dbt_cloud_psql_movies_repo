with payments_enriched as (
    select *
    from {{ ref('int_payments_enriched_with_store_film_category') }}
)

select
    payment_id,
    store_id,
    category_id,
    film_id,
    payment_date,
    date_trunc('day', payment_date) as payment_day,
    film_title,
    category_name,
    amount as revenue_amount
from payments_enriched