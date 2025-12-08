# 배스천 호스트용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "lb_sg" {
  name        = "${local.name_prefix}-lb-SG-${local.environment}"
  description = "SecurityGroup generated from terraform"
  loggable = false
  tags        = local.common_tags
}

# 쿠버네티스 클러스터용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "k8s_sg" {
  name        = "${local.name_prefix}-k8s-SG-${local.environment}"
  description = "SecurityGroup generated from terraform"
  loggable = false
  tags        = local.common_tags
}

# 데이터베이스용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "bastion_sg" {
  name        = "${local.name_prefix}-bastion-SG-${local.environment}"
  description = "SecurityGroup generated from terraform"
  loggable = false
  tags        = local.common_tags
}

