 # Build Reusable Terraform Module to provision AWS infrastructures

 Configuration files in this git repo
 
 # File structure 
<img width="1051" height="365" alt="image" src="https://github.com/user-attachments/assets/17d73323-b263-45b1-aff6-0e808bd3bdc6" />

 
 # Note 
 To store and lock the state file, it is recommended to create the S3 bucket and DynamoDB table manually either via AWS console or using AWS CLI commands.
 
 # Why?

 If you use Terraform to create them, you might accidentally destroy them when you run "terraform destroy" command. 

# Using AWS CLI commands:

# Create s3 bucket in us-east-1

```
aws s3api create-bucket \
  --bucket seg-terraform-state-bucket \
  --region us-east-1
```

# Enable Versioning 
```
aws s3api put-bucket-versioning \
  --bucket seg-terraform-state-bucket \
  --versioning-configuration Status=Enabled
```

# Verify 
```
aws s3api get-bucket-versioning \
  --bucket seg-terraform-state-bucket
```


# Create DynamoDB table for state locking

```
aws dynamodb create-table \
  --table-name terraform-state-lock \
  --billing-mode PAY_PER_REQUEST \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH
 ```



# To create the file structure - tree 

 terraform/
├── backend.tf          # for remote backend storage and locking - to store state file remotely 
├── provider.tf
├── main.tf              # calls module
├── variables.tf
├── terraform.tfvars      # to take in the values for the variables  like instance type (t3.micro), etc        
├── outputs.tf            # output instance ids and private ips using the module and name of the outputs in the child module
│
└── modules/
    └── aws-infra/
        ├── main.tf      ✅ data + resource together
        ├── variables.tf
        └── outputs.tf  
Helpful terraform commands to keep your code clean and readable in the current directory and all subdirectories 
```
terraform fmt -recursive
``` 
