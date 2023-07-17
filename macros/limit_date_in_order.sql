{% macro limit_date_in_order(column_name, days_of_data=5)%}
{% if target.name == 'dev'%}
where {{column_name }} >= dateadd('day', - {{days_of_data}}, current_timestamp)
{% endif %}
{% endmacro %}