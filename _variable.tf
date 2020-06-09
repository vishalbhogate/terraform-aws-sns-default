variable "topic_name" {
  description = "Topic name"
}

variable "account_ids" {
  type        = list(string)
  description = "List of accounts to allow publishing to SNS"
}