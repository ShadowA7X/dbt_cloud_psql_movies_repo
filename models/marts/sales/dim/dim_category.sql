-- models/marts/sales/dim/dim_category.sql

select
    category_id,
    name as category_name
from {{ ref('stg_pagila__category') }}