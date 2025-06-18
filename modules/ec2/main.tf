resource "aws_instance" "this" {
  for_each = var.instances
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  subnet_id                   = data.aws_subnet.selected[each.key].id
  vpc_security_group_ids      = [data.aws_security_group.selected[each.key].id]
  associate_public_ip_address = each.value.associate_public_ip_address
  key_name                    = each.value.key_name
  tags                        = each.value.tags
}


# Fetch subnet by Name tag
data "aws_subnet" "selected" {
  for_each = var.instances

  filter {
    name   = "tag:Name"
    values = [each.value.subnet_name]
  }
}

# Fetch SG by Name tag
data "aws_security_group" "selected" {
  for_each = var.instances

  filter {
    name   = "tag:Name"
    values = [each.value.sg_name]
  }
}
