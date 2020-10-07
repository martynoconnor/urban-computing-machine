# AWS credentials - to avoid storing creds in a file in plain text
# you should set these in your terminal before calling Terraform.
# However, as this is a proof of concept, I'm going to store them
# here for simplicity and ease.

variable "access_key" {
  default = "abcdef"
}
variable "secret_key" {
  default = "abcdef"
}

variable "splunk_password" {
  default = "changed123!"
}

# AWS region
variable "region" {
  default = "ap-southeast-2"
}

# Cluster pass4SymmKey
variable "cluster_pass4SymmKey" {
  default = "democluster"
}

# Search Head Cluster pass4SymmKey
variable "shc_pass4SymmKey" {
  default = "demoshcluster"
}

# Search Head Cluster Label
variable "shcluster_label" {
  default = "demoshcluster"
}

# Environment Build Name - think of this as a label for your environment
variable "env_name" {
  default = "test_env"
}

# Set the ami here - all instances will be built using the same one
variable "ami" {
  default = "ami-0650cf37ced9a2e0f"  # Ubuntu 20.04 on ap-se-2
}

# Set the indexer instance type here
variable "indexer_size" {
  default = "t2.micro"
}

# Set the search head instance type here
variable "search_head_size" {
  default = "t2.micro"
}

# Set the cluster master instance type here
variable "cluster_master_size" {
  default = "t2.micro"
}

# Generic instance type for non-essential boxes
variable "generic_size" {
  default = "t2.micro"
}

# Define Splunk ports

# Splunk web interface port
variable "splunkweb_port" {
  default = "8000"
}

# Splunk port for forwarders to talk to indexers
variable "splunk_tcpin" {
  default = "9997"
}

# Splunk management and REST API port
variable "splunk_mgmt_port" {
  default = "8089"
}

# Splunk clustered indexer replication port
variable "indexer_replication_port" {
  default = "9887"
}

# Splunk clustered search head replication port
variable "shc_rep_port" {
  default = "8181"
}

# Splunk SHC replication factor
variable "shc_rep_factor" {
  default = "2"
}

# Splunk KVStore replication port
variable "kvstore_replication_port" {
  default = "8191"
}

# Splunk HTTP Event Collector port
variable "hec_port" {
  default = "8088"
}

# SSH Daemon port
variable "ssh_port" {
  default = "22"
}
