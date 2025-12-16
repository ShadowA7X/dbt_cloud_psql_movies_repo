with base as (
    select *
    from {{ ref('fct_sales_payments') }}
)

select
    payment_day,
    store_id,
    film_id,
    film_title,
    category_id,
    category_name,
    sum(revenue_amount) as revenue_amount
from base
group by
    payment_day,
    store_id,
    film_id,
    film_title,
    category_id,
    category_name