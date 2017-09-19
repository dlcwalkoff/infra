variable ssh_source_ranges {
    description = "Allowed SSH IP addresses"
    default = ["0.0.0.0/0"]
}

variable mongo_source_ranges {
    description = "Allowed MongoDB IP addresses"
    default = ["0.0.0.0/0"]
}

variable puma_source_ranges {
    description = "Allowed Puma service IP addresses"
    default = ["0.0.0.0/0"]
}