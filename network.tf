# Define the virtual private cloud
resource "aws_vpc" "splunk-cluster-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "splunk-cluster-env"
  }
}

# Define a security group with ingress/egress rules
resource "aws_security_group" "splunk_generic" {
  name        = "Security Group"
  description = "Allows traffic on required ports"

  ingress {
    # Splunk web
    from_port   = var.splunkweb_port
    to_port     = var.splunkweb_port
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    # cidr_blocks = ["81.174.151.36/32"] # My static IP at home
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # Splunk data flow for indexers
    from_port   = var.splunk_tcpin
    to_port     = var.splunk_tcpin
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Not ideal - revisit when you know how to set to instances in AWS
  }

  ingress {
    # Splunk management port
    from_port   = var.splunk_mgmt_port
    to_port     = var.splunk_mgmt_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Not ideal - revisit when you know how to set to instances in AWS
  }

  ingress {
    # Clustered indexer replication port
    from_port   = var.indexer_replication_port
    to_port     = var.indexer_replication_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Not ideal - revisit when you know how to set to instances in AWS
  }

  ingress {
    # Clustered search head replication port - this is set by the customer and so will change
    from_port   = var.shc_rep_port
    to_port     = var.shc_rep_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Not ideal - revisit when you know how to set to instances in AWS
  }

  ingress {
    # KV Store replication
    from_port   = var.kvstore_replication_port
    to_port     = var.kvstore_replication_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Not ideal - revisit when you know how to set to instances in AWS
  }

  ingress {
    # HTTP Event Collector
    from_port   = var.hec_port
    to_port     = var.hec_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Not ideal - revisit when you know how to set to instances in AWS
  }

  ingress {
    # SSH access for administration
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["103.216.190.94/32"] # My static IP at home, the office IPs

  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
}
