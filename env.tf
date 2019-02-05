resource "aws_elastic_beanstalk_environment" "cand1-uat-env" {
  name                = "cand1-UAT-env"
  application         = "${aws_elastic_beanstalk_application.cand1-app.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.11.7 running Multi-container Docker 18.06.1-ce (Generic)"
  tier                = "WebServer"
  #cname               = ""
  description          = "UAT environment for the candidate app deployment"
  wait_for_ready_timeout = "30m"
  # version_label = "1"

# virtual prrivate cloud setting
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-UAT"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-111"
  }

  setting {
     namespace ="aws:ec2:vpc"
     name      = "AssociatePublicIpAddress"
     value     = "true"
  }
  # ami image setting to launch
  setting {
     namespace = "aws:autoscaling:launchconfiguration"
     name = "InstanceType"
     value = "t2.micro"
  }
  setting {
     namespace = "aws:autoscaling:launchconfiguration"
     name      = "EC2KeyName"
     value     = "KeyPair1"
  }
  setting {
     namespace = "aws:autoscaling:launchconfiguration"
     name      = "IamInstanceProfile"
     value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
     namespace = "aws:autoscaling:launchconfiguration"
     name      = "ImageId"
     value     = "ami-created by my packer process"
  }
  setting {
     namespace = "aws:autoscaling:launchconfiguration"
     name      = "MonitoringInterval"
     value     = "5min"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "use a security group present in my vpc"
  }
 setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SSHSourceRestriction"
    value     ="tcp, 22, 22, bastion-server-ip/32"
  }
 setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeType"
    value     = "gp2"
  }
 setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = "10"
  }

  #environment setting
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "EnvironmentType"
    value = "LoadBalanced"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "LoadBalancerType"
    value = "application"
  }
  }
