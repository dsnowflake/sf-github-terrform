resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo1_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}
