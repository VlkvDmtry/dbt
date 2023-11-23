{{ config(
    schema = 'vault',
    materialized = 'incremental'
) }}

{% set source_model = 'stg_flights_tickets' %}
{% set src_pk = 'ticket_flight_pk' %}
{% set src_fk = ['ticket_pk', 'flight_pk'] %}
{% set src_ldts = 'load_date' %}
{% set src_source = 'record_source' %}

{{ automate_dv.link(
    src_pk = src_pk,
    src_fk = src_fk,
    src_ldts = src_ldts,
    src_source = src_source,
    source_model = source_model
) }}