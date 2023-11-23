{{ config(
    schema = 'stage',
    materialized = 'table'
) }}

SELECT
    flight_id as flight_nk,
    flight_no as flight_num,
    scheduled_departure :: TIMESTAMP AS departure_datetime,
    scheduled_departure :: DATE AS departure_date,
    departure_airport,
    scheduled_arrival :: TIMESTAMP AS arrival_datetime,
    scheduled_arrival :: DATE AS arrival_date,
    arrival_airport,
    status,
    CURRENT_TIMESTAMP as dml_date
FROM
    {{ source('demodb', 'flights') }}
WHERE
    scheduled_departure BETWEEN '{{ var('start_date') }}'
    AND '{{ var('end_date') }}'
