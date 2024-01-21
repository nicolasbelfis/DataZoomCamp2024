variable "location" {
  description = "my gcs project location"
  default     = "EU"
}

variable "bq_dataset_name" {
  description = "my big query dataset name"
  default     = "dataset_demo"
}

variable "gcs_storage_name" {
  description = "my storage name"
  default     = "auto-expiring-bucket-sanguine-fusion-410917"
}

variable "gcs_storage_class" {
  description = "my gcs storage"
  default     = "STANDARD"
}
