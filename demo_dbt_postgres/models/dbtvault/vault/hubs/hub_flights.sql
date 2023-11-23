{{ config(
    schema = 'vault',
    materialized = 'incremental'
) }}

{% set source_model = 'stg_flights' %}
{% set src_pk = 'flight_pk' %}
{% set src_nk = 'flight_nk' %}
{% set src_ldts = 'load_date' %}
{% set src_source = 'record_source' %}

{{ automate_dv.hub(
    source_model = source_model,
    src_pk = src_pk,
    src_nk = src_nk,
    src_ldts = src_ldts,
    src_source = src_source
) }}
