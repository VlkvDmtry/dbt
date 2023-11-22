{{ config(
    materialized = 'table'
) }}

SELECT
    f.flight_id,
    f.departure_airport,
    acd.airport_name as departure_airport_name,
    acd.city as departure_city,
    f.arrival_airport,
    aca.airport_name as arrival_airport_name,
    aca.city as arrival_city,
    {{ datetime_dif_str('f.departure_datetime', 'f.arrival_datetime') }} as flight_duration,
    tf.fare_conditions,
    COUNT(t.ticket_no) AS ticket_cnt,
    SUM(tf.amount) AS total_profit
FROM
    {{ ref("tickets_stg") }} t
    JOIN {{ source('demodb', 'ticket_flights') }} tf
    ON tf.ticket_no = t.ticket_no
    JOIN {{ ref("flights_stg") }} f
    ON f.flight_id = tf.flight_id
    LEFT JOIN {{ ref("airport_codes") }} acd
    ON acd.airport_code = f.departure_airport
    LEFT JOIN {{ ref("airport_codes") }} aca
    ON aca.airport_code = f.arrival_airport
GROUP BY
    f.flight_id,
    f.departure_airport,
    f.departure_datetime,
    acd.airport_name,
    acd.city,
    f.arrival_airport,
    f.arrival_datetime,
    aca.airport_name,
    aca.city,
    tf.fare_conditions
ORDER BY
    f.flight_id,
    tf.fare_conditions
