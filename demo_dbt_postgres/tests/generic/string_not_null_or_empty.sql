{% test string_not_null_or_empty(model, column_name, key_field) %}

    {{ config(severity = 'warn') }}

    select distinct {{ key_field }} 
    from {{ model }} 
    where trim({{ column_name }}) = '' or trim({{ column_name }}) is null
    
{% endtest %}