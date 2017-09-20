variable ssh_source_ranges {
  description = "Allowed SSH IP addresses"
  default     = ["0.0.0.0/0"]
}

variable ssh_allow_ports {
  description = "Allowed ports for SSH"
  default     = ["22"]
}

variable mongo_source_ranges {
  description = "Allowed MongoDB IP addresses"
  default     = ["0.0.0.0/0"]
}

variable mongo_target_tags {
  description = "MongoDB target tags"
  default     = ["reddit-db"]
}

variable mongo_source_tags {
  description = "MongoDB source tags"
  default     = ["reddit-app"]
}

variable puma_source_ranges {
  description = "Allowed Puma service IP addresses"
  default     = ["0.0.0.0/0"]
}

variable puma_target_tags {
  description = "Puma target tags"
  default     = ["reddit-app"]
}
