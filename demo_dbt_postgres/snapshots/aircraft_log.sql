{% snapshot aircraft_log %}
    {{ config(
        target_schema = 'dbt',
        unique_key = 'aircraft_code',
        strategy = 'timestamp',
        updated_at = 'dml_date',
        invalidate_hard_deletes = True
    ) }}

    SELECT
        aircraft_code,
        model ->> 'ru' AS aircraft_name,
        RANGE,
        dml_date
    FROM
        {{ source(
            'demodb',
            'aircrafts'
        ) }}
{% endsnapshot %}
