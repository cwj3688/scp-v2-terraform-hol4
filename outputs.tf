# VPC 출력
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
# Firewall 출력
output "firewallrule_output1" {
  value = samsungcloudplatformv2_firewall_firewall_rule.my_igw_fwrule_systemupdate
}

output "firewallrule_output2" {
  value = samsungcloudplatformv2_firewall_firewall_rule.my_igw_fwrule_webservice
}

output "firewallrule_output3" {
  value = samsungcloudplatformv2_firewall_firewall_rule.my_igw_fwrule_k8s
}

output "firewallrule_output4" {
  value = samsungcloudplatformv2_firewall_firewall_rule.my_igw_fwrule_ssh
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
# MariaDB 클러스터 ID
output "mariadb_cluster_id" {
  value = samsungcloudplatformv2_mariadb_cluster.my_mariadb.id
}

# MariaDB 인스턴스 서비스 IP 리스트
output "mariadb_instance_ips" {
  description = "MariaDB Cluster Instance Service IPs"
  value       = flatten(samsungcloudplatformv2_mariadb_cluster.my_mariadb.instance_groups[*].instances[*].service_ip_address)
}

# MariaDB 서비스 상태
output "mariadb_service_state" {
  value = samsungcloudplatformv2_mariadb_cluster.my_mariadb.service_state
}

# Public IP 출력
output "bastion_public_ip_address" {
  value = samsungcloudplatformv2_vpc_publicip.bastion_publicip.publicip
}

output "natgw_public_ip_address" {
  value = samsungcloudplatformv2_vpc_publicip.natgw_publicip.publicip
}