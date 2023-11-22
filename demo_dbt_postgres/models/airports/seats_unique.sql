with seats as (
    select seat_no from {{ source('demodb','seats') }}
)

{{ dbt_utils.deduplicate(
    relation = 'seats',
    partition_by = 'seat_no',
    order_by = 'seat_no',
   )
}}