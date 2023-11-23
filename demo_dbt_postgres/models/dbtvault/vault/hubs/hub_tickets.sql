{{ config(
    schema = 'vault',
    materialized = 'incremental'
) }}

{% set source_model = 'stg_tickets' %}
{% set src_pk = 'ticket_pk' %}
{% set src_nk = 'ticket_nk' %}
{% set src_ldts = 'load_date' %}
{% set src_source = 'record_source' %}

{{ automate_dv.hub(
    source_model = source_model,
    src_pk = src_pk,
    src_nk = src_nk,
    src_ldts = src_ldts,
    src_source = src_source
) }}
