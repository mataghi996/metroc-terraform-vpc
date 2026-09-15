locals {
    ssm_parameter = {
        vpc_id = {
            name = "/metroc/vpc/id"
            value = aws_vpc.customVPC.id
        }
        subnet1_id = {
            name = "/metroc/subnet1/id"
            value = aws_subnet.subnet1.id
        }
        subnet2_id = {
            name = "/metroc/subnet2/id"
            value = aws_subnet.subnet2.id
        }
        subnet3_id = {
            name = "/metroc/subnet3/id"
            value = aws_subnet.subnet3.id
        }
        subnet4_id = {
            name = "/metroc/subnet4/id"
            value = aws_subnet.subnet4.id
        }
        alb_alb_sg_id = {
            name = "/metroc/alb/sg/id"
            value = aws_security_group.albsg.id
        }
         alb_ec2_sg_id = {
            name = "/metroc/ec2/sg/id"
            value = aws_security_group.ec2sg.id
        }
        
    }

}

resource "aws_ssm_parameter" "customVPCSsm" {
  for_each = local.ssm_parameters
  
  name  = each.value.name
  type  = "String"
  value = each.value.value
}