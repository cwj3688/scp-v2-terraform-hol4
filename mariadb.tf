# MariaDB 클러스터 생성
resource "samsungcloudplatformv2_mariadb_cluster" "my_mariadb" {
  # 기본 정보
  name = "mdb"
  subnet_id = samsungcloudplatformv2_vpc_subnet.db_subnet.id
  dbaas_engine_version_id = var.mariadb_engine_version_id
  instance_name_prefix = "${local.name_prefix}-mariadb"
  ha_enabled              = false
  timezone = var.mariadb_timezone
  nat_enabled = false
  service_state = "RUNNING"

  
  # 접근 제어 (허용할 IP 주소)
  allowable_ip_addresses  = ["192.168.0.0/24", "192.168.50.0/24"] # VPC CIDR 전체 허용 예시
  
  # 초기 설정
  init_config_option = {
    audit_enabled = false
   
    backup_option = { }

    database_character_set = "utf8"
    database_name          = var.mariadb_database_name
    database_port          = 2866
    database_user_name     = var.mariadb_username
    database_user_password = var.mariadb_password
  }
  
  # 인스턴스 그룹 설정
  instance_groups = [{
    role_type = "ACTIVE"
    server_type_name = var.server_type_name
    instances = [
        {
            role_type = "ACTIVE"

        }
    ]
    
    block_storage_groups = [{
      role_type   = "OS"
      size_gb     = var.mariadb_storage_size
      volume_type = "SSD"
    }]
  }]

  # 유지보수 설정
  maintenance_option = { }
  
  # 태그
  tags = local.common_tags
}