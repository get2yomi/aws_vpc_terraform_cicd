# this is used to lockstate file in a s2 bucket this will prevent multiple users from using the same state file
terraform {
    backend "s3" {
        bucket = "statefilterraform"
        key    = "aws_vpc_CICD_Terraform/terraform.tfstate"
        region = "us-east-1"
        encrypt = true    # Enable encryption
        dynamodb_table = "terraform-lock" # DynamoDB table for locking
        # attibute name is set to LockID
    }  
}