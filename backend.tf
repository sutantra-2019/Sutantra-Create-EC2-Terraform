terraform {
  backend "s3" {
    bucket = "pge-ecm-terraform-state"
    key    = "Sample/EC2/terraform_ec2.tfstate"
    region = "us-west-2"
    dynamodb_table = "S3_Terraform_State_Lock"
 }
}