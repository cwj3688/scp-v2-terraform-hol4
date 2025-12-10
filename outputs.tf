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

output "db_subnet_id" {
  description = "Database Subnet ID"
  value       = samsungcloudplatformv2_vpc_subnet.db_subnet.id
}

output "k8s_subnet_id" {
  description = "Kubernetes Subnet ID"
  value       = samsungcloudplatformv2_vpc_subnet.k8s_subnet.id
}

# Security Group 출력
output "lb_sg_id" {
  description = "Load Balancer Security Group ID"
  value       = samsungcloudplatformv2_security_group_security_group.lb_sg.id
}

output "bastion_sg_id" {
  description = "Bastion Security Group ID"
  value       = samsungcloudplatformv2_security_group_security_group.bastion_sg.id
}

output "k8s_sg_id" {
  description = "Kubernetes Security Group ID"
  value       = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
}

# keypair 출력
output "keypair_output" {
  value = samsungcloudplatformv2_virtualserver_keypair.keypair
}

# virtualserver 출력
output "virtualserver_output" {
  value = samsungcloudplatformv2_virtualserver_server.bastion
}


# DB 출력
output "mariadb_output" {
  value = samsungcloudplatformv2_mariadb_cluster.my_mariadb.instance_groups
  sensitive = true
}