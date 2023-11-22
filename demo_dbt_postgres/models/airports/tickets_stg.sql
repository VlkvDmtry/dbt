{{ 
    config(materialized = 'ephemeral') 
}}

SELECT
    ticket_no,
    passenger_id,
    passenger_name,
    contact_data ->> 'phone' AS passenger_phone
FROM
    {{ source('demodb', 'tickets') }}
