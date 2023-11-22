{{ config(
    schema = 'stage',
    materialized = 'table'
) }}

SELECT
    ticket_no AS ticket_nk,
    passenger_id,
    passenger_name,
    contact_data ->> 'phone' AS passenger_phone,
    dml_date
FROM
    {{ source('demodb', 'tickets') }}
