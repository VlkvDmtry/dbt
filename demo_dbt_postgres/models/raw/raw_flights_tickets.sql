{{ config(
    schema = 'stage',
    materialized = 'table'
) }}

SELECT
    ticket_no AS ticket_nk,
    flight_id AS flight_nk, 
    fare_conditions,
    amount AS price,
    CURRENT_TIMESTAMP as dml_date
FROM
    {{ source('demodb', 'ticket_flights') }}
