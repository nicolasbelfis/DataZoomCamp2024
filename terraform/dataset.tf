resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.bq_dataset_name
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = var.location
  default_table_expiration_ms = 3600000
}
