# VPC 정보 출력
output "vpc_output" {
  value = samsungcloudplatformv2_vpc_vpc.my_vpc
}

# Internet Gateway 출력
output "igw_output" {
  value = samsungcloudplatformv2_vpc_internet_gateway.my_igw
}

# Subnet 출력
output "lb_subnet_id" {
  description = "Load Balancer Subnet ID"
  value       = samsungcloudplatformv2_vpc_subnet.lb_subnet.id
}

output "k8s_subnet_id" {
  description = "Kubernetes Subnet ID"
  value       = samsungcloudplatformv2_vpc_subnet.k8s_subnet.id
}

output "db_subnet_id" {
  description = "Database Subnet ID"
  value       = samsungcloudplatformv2_vpc_subnet.db_subnet.id
}


output "keypair_output" {
  value = samsungcloudplatformv2_virtualserver_keypair.keypair
}