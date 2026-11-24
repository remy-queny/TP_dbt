{% set expected_count = {
    'customers': 50,
    'employees': 20,
    'stores': 10,
    'suppliers': 5,
    'products': 100,
    'orders': 200,
    'orderitems': 1000
} %}

{% for table_name, expected in expected_count.items() %}
    SELECT '{{ table_name }}' AS table_name, 
              (SELECT COUNT(*) FROM {{ source('bronze', table_name) }}) AS record_count, 
              {{ expected }} AS expected_count
    FROM DUAL
    WHERE (SELECT COUNT(*) FROM {{ source('bronze', table_name) }}) < {{ expected }}
    {% if not loop.last %} UNION ALL {% endif %}
{% endfor %}