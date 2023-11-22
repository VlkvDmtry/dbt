SELECT
    flight_id,
    flight_no,
    scheduled_departure :: TIMESTAMP AS departure_datetime,
    scheduled_departure :: DATE AS departure_date,
    departure_airport,
    scheduled_arrival :: TIMESTAMP AS arrival_datetime,
    scheduled_arrival :: DATE AS arrival_date,
    arrival_airport,
    status
FROM
    {{ source(
        'demodb',
        'flights'
    ) }}
