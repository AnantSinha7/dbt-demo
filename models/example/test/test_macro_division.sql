{{
    config(
        database = 'DBT_DEMO',
        schema = 'DBT_TEST_AUDIT',
        materialized = 'view')
}}

with div_test AS(
    select 
    {{ division(200000) }} AS Divided_Amount
)
SELECT 
    CASE
        WHEN Divided_Amount = 200 THEN 'PASS'
        ELSE CONCAT('ERROR: Division Error. Expected:200, Actual: ', Divided_Amount)
    END AS test_result,
    Divided_Amount AS current_output,
    '200' AS expected_output
FROM 
    div_test