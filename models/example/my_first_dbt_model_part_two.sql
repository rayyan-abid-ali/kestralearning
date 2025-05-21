
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select
  source_data.*,
  CASE WHEN id is null THEN 'this is null' ELSE 'this is not null' END AS is_this_null
from {{ ref("my_first_dbt_model") }}  AS source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
