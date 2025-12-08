# Bastion Host용 Virtual Server 생성
resource "samsungcloudplatformv2_virtualserver_server" "bastion" {
  # 기본 정보
  name = "${local.name_prefix}-bastion-${local.environment}"
  state = "ACTIVE"
  
  # 네트워크 설정
  # vpc_id              = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  # subnet_id           = samsungcloudplatformv2_vpc_subnet.lb_subnet.id
  security_groups = [samsungcloudplatformv2_security_group_security_group.bastion_sg.id]
  
  image_id = "b8cd519a-c8ce-4a51-ac8d-aab9888339bc"
  server_type_id = "s1v1m2"
  
  # 스토리지 설정
  boot_volume = {
    size                  = 48
  }

  networks = {
    interface_1 = {
      subnet_id = samsungcloudplatformv2_vpc_subnet.lb_subnet.id
       public_ip_id = samsungcloudplatformv2_vpc_publicip.bastion_publicip.id
    },
   
  }
  
  # Keypair 연결
  keypair_name  = samsungcloudplatformv2_virtualserver_keypair.keypair.name
  
  
  # 태그
  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-bastion-${local.environment}"
      Role = "Bastion Host"
      Purpose = "Secure Gateway"
    }
  )
  
  # # 리소스 의존성
  # depends_on = [
  #   samsungcloudplatformv2_vpc_subnet.lb_subnet,
  #   samsungcloudplatformv2_security_group_security_group.lb_sg,
  #   samsungcloudplatformv2_virtualserver_keypair.keypair
  # ]
}