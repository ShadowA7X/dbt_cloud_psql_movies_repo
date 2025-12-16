-- models/marts/sales/dim/dim_store.sql

select
    store_id,
    manager_staff_id
from {{ ref('stg_pagila__store') }}