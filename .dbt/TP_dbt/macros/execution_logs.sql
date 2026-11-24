{% macro create_execution_logs_table() %}
    create table if not exists training.execution_logs (
        id integer auto_increment primary key,
        model_name varchar(255) not null,
        action varchar(10) not null,
        inserted_at timestamp not null default current_timestamp
    )
{% endmacro %}

{% macro log_model_execution(model_relation, action) %}
    insert into training.execution_logs (model_name, action, inserted_at)
    values (
        '{{ model_relation.identifier | replace("'", "''") }}',
        '{{ action }}',
        current_timestamp
    )
{% endmacro %}
