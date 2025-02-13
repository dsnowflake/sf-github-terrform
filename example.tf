# Create a database
resource "snowflake_database" "example_db" {
  name = "EXAMPLE_DB"
}

# Create a schema within the database
resource "snowflake_schema" "example_schema" {
  name     = "EXAMPLE_SCHEMA"
  database = snowflake_database.example_db.name
}

# Create a table within the schema
resource "snowflake_table" "example_table" {
  name     = "EXAMPLE_TABLE"
  database = snowflake_database.example_db.name
  schema   = snowflake_schema.example_schema.name

  column {
    name = "ID"
    type = "NUMBER"
  }

  column {
    name = "NAME"
    type = "VARCHAR(255)"
  }

  column {
    name = "CREATED_AT"
    type = "TIMESTAMP"
  }
}


