 # Build Reusable Terraform Module to provision AWS infrastructure 

 Configuration files in this git repo
 
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
