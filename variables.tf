variable "count" {
  description = "Shows the actual count of the AWS EC2 instances"
  type        = number
  default     = "2"
}

variable "ami" {
  description = "Will take the ami id from the aws to create the Amazon Linux 2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "Will take the required instance type for the above instances with apt. CPU and RAM"
  type        = string
  default     = "t2.micro"
}

variable "cluster_id" {
  description = "This is the actual cluster_id"
  type        = string
  default     = "example-elasticache-cluster"
}

variable "engine" {
  description = "This is the actual engine name"
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "This is the actual node type of the engine"
  type        = string
  default     = "cache.t2.micro"
}
.
variable "num_cache_nodes" {
  description = "This is the actual count of the cache nodes required"
  type        = number
  default     = "1"
}


