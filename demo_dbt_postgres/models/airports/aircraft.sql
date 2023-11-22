{{ config(
    materialized = 'incremental',
    unique_key = 'aircraft_code'
) }}

SELECT
    aircraft_code,
    model ->> 'ru' AS aircraft_name,
    RANGE,
    dml_date AS source_dml_date,
    CURRENT_TIMESTAMP AS dbt_dml_date
FROM
    {{ source('demodb', 'aircrafts') }}

{% if is_incremental() %}
WHERE
    dml_date >= (
        SELECT
            MAX(dbt_dml_date)
        FROM
            {{ this }}
    )
{% endif %}
