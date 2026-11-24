{{ config(
    pre_hook="CREATE TABLE IF NOT EXISTS training.execution_logs (id INTEGER AUTO_INCREMENT PRIMARY KEY, model_name VARCHAR(255) NOT NULL, action VARCHAR(10) NOT NULL, inserted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP); INSERT INTO training.execution_logs (model_name, action, inserted_at) VALUES ('profit_us', 'start', CURRENT_TIMESTAMP)",
    post_hook="INSERT INTO training.execution_logs (model_name, action, inserted_at) VALUES ('profit_us', 'end', CURRENT_TIMESTAMP)"
) }}

{{ generate_profit_model('sales_us', var('eur_rate_us')) }}