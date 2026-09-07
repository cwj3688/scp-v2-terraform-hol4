resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_lb_http" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.lb_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "ingress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 80
  port_range_max    = 80
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_lb_https" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.lb_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "ingress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 443
  port_range_max    = 443
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_lb_http]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_kubectl" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "ingress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "${local.my_current_ip_address}"
  port_range_min    = 6443
  port_range_max    = 6443
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_k8s_https]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_update_http" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 80
  port_range_max    = 80
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_kubectl]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_update_https" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 443
  port_range_max    = 443
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_update_http]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_bastion_out_http" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.bastion_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 80
  port_range_max    = 80
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_update_https]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_bastion_out_https" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.bastion_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 443
  port_range_max    = 443
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_bastion_out_http]
}
resource "samsungcloudplatformv2_security_group_security_group_rule" "allow_bastion_mariadb" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.bastion_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "192.168.100.0/24"
  port_range_min    = 2866
  port_range_max    = 2866
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_update_http]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "allow_k8s_mariadb" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "192.168.100.0/24"
  port_range_min    = 2866
  port_range_max    = 2866
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.allow_bastion_mariadb]
}


resource "samsungcloudplatformv2_security_group_security_group_rule" "allow_ssh_internal" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.bastion_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "ingress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "${local.my_current_ip_address}"
  port_range_min    = 22
  port_range_max    = 22
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.allow_k8s_mariadb]
}
