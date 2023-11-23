{{ config(
    schema = 'stage',
    materialized = 'view'
) }}

{% set yaml_metadata %}
source_model: 'raw_tickets'
derived_columns:
  record_source: '!DEMO_DB'
  load_date: dml_date
  effective_from: dml_date
hashed_columns:
  ticket_pk: ticket_nk
  ticket_hashdiff:
    is_hashdiff: true
    columns:
      - ticket_nk
      - passenger_id
      - passenger_name
      - passenger_phone
      - effective_from
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict ['source_model'] %}
{% set derived_columns = metadata_dict ['derived_columns'] %}
{% set null_columns = metadata_dict ['null_columns'] %}
{% set hashed_columns = metadata_dict ['hashed_columns'] %}
{% set ranked_columns = metadata_dict ['ranked_columns'] %}

{{ automate_dv.stage(
    include_source_columns = true,
    source_model = source_model,
    derived_columns = derived_columns,
    null_columns = null_columns,
    hashed_columns = hashed_columns,
    ranked_columns = ranked_columns
) }}
