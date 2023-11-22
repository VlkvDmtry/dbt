SELECT
    flight_id, fare_conditions
FROM
    {{ ref("flights_rep") }}
WHERE total_profit < 0
