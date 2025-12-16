-- models/marts/sales/dim/dim_film.sql

select
    film_id,
    title as film_title,
    release_year,
    rating,
    length,
    language_id
from {{ ref('stg_pagila__film') }}