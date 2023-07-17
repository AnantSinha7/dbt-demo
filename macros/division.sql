{% macro division(column_name, decimal_places=2) -%}
    round( 1.0 * {{column_name}} / 1000, {{decimal_places }})
{%- endmacro %}