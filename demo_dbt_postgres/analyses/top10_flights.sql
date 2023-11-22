SELECT
    departure_airport,
    departure_airport_name,
    arrival_airport,
    arrival_airport_name,
    SUM(total_profit) AS total_profit
FROM
    {{ ref("flights_rep") }}
GROUP BY
    departure_airport,
    departure_airport_name,
    arrival_airport,
    arrival_airport_name
ORDER BY
    total_profit DESC
LIMIT 10