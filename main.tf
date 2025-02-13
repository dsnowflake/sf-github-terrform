terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "LearnWithSadrul"

    workspaces {
      name = "git-action-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo1_db" {
  name    = "DEMO1_DB"
  comment = "Database for Snowflake Terraform demo"
}
