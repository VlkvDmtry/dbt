{{ config(
    schema = 'vault',
    materialized = 'incremental'
) }}

{% set yaml_metadata %}
source_model: 'stg_flights'
src_pk: 'flight_pk'
src_hashdiff: 
  source_column: 'flight_hashdiff'
  alias: 'hashdiff'
src_payload:
  - 'flight_num'
  - 'departure_datetime'
  - 'departure_date'
  - 'departure_airport'
  - 'arrival_datetime'
  - 'arrival_date'
  - 'arrival_airport'
  - 'status'
src_eff: 'effective_from'
src_ldts: 'load_date'
src_source: 'record_source'
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict['src_pk'],
                   src_hashdiff=metadata_dict['src_hashdiff'],
                   src_payload=metadata_dict['src_payload'],
                   src_eff=metadata_dict['src_eff'],
                   src_ldts=metadata_dict['src_ldts'],
                   src_source=metadata_dict['src_source'],
                   source_model=metadata_dict['source_model'])   }}