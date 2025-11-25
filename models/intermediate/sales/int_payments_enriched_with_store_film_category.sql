with payment as (
    select * from {{ ref('stg_pagila__payment') }}
),

rental as (
    select * from {{ ref('stg_pagila__rental') }}
),

inventory as (
    select * from {{ ref('stg_pagila__inventory') }}
),

film as (
    select
        film_id,
        title as film_title
    from {{ ref('stg_pagila__film') }}
),

-- film ↔ category (one film can have multiple categories)
film_category as (
    select
        fc.film_id,
        c.category_id,
        c.name as category_name
    from {{ ref('stg_pagila__film_category') }} fc
    join {{ ref('stg_pagila__category') }} c
      on fc.category_id = c.category_id
),

store as (
    select * from {{ ref('stg_pagila__store') }}
),

-- Join chain: payment → rental → inventory → store + film (+ category)
payment_enriched as (
    select
        p.payment_id,
        p.amount,
        p.payment_date,

        r.rental_id,
        i.inventory_id,

        i.store_id,
        s.manager_staff_id,

        i.film_id,
        f.film_title,

        fc.category_id,
        fc.category_name
    from payment p
    join rental r
      on p.rental_id = r.rental_id
    join inventory i
      on r.inventory_id = i.inventory_id
    join store s
      on i.store_id = s.store_id
    join film f
      on i.film_id = f.film_id
    -- left join here so films without a category (unlikely) don’t drop the row
    left join film_category fc
      on f.film_id = fc.film_id
)

select * from payment_enriched
