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

# Insert data into the table
resource "snowflake_table" "example_table_insert" {
  name     = "EXAMPLE_TABLE"
  database = snowflake_database.example_db.name
  schema   = snowflake_schema.example_schema.name

  # This is a hack to insert data using Terraform, as Terraform doesn't natively support INSERT statements.
  # You can use a local-exec provisioner to run a SQL command.
  provisioner "local-exec" {
    command = <<EOT
      snowsql -a ${var.snowflake_account} -u ${var.snowflake_user} -p ${var.snowflake_password} -r ${var.snowflake_region} -q "INSERT INTO ${snowflake_database.example_db.name}.${snowflake_schema.example_schema.name}.${snowflake_table.example_table.name} (ID, NAME, CREATED_AT) VALUES (1, 'John Doe', CURRENT_TIMESTAMP());"
    EOT
  }
}
