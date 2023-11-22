{%- macro datetime_dif_str(earlier_dt, later_dt) -%}
    to_char({{ later_dt }} - {{ earlier_dt }}, 'HH24:MI')
{%- endmacro -%}