{{
  config(
    materialized = 'table'
  )
}}

with spine as (

  {{
    dbt.date_spine(
      'day',
      "cast('2000-01-01' as date)",
      "cast(current_date + interval '1 year' as date)"
    )
  }}

)

select
  cast(date_day as date) as date_day
from spine
