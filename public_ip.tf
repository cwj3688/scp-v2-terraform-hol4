# Bastion Host용 Public IP 생성
resource "samsungcloudplatformv2_vpc_publicip" "bastion_publicip" {
    description = "Bastion Public ip"
    type = "IGW"
    tags = local.common_tags
}

# NAT Gateway용 Public IP 생성
resource "samsungcloudplatformv2_vpc_publicip" "natgw_publicip" {
    description = "NAT Gateway Public ip"
    type = "IGW"
    tags = local.common_tags
}