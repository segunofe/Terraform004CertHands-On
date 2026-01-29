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

        
# Helpful terraform commands to keep your code clean and readable in the current directory and all subdirectories 
```
terraform fmt -recursive
terraform init -reconfigure  # if you made any changes on your configuration files
terraform init -migrate-state  # if you made changes to your backend.tf file
```

# Git commands to push updated code from VSCode for Repo in GitHub
1. Switch to your project folder where the configuration files are located
```
cd path/to/your/project
```

2. Initialize git (if not already done)
```
git init
```

3. Add your remote GitHub repository
```
git remote add origin https://github.com/username/repo.git
```

4. Stage your changes
```
git add .
```
NOTE: . adds all files. You can also stage individual files with git add filename

5. Commit your changes
```
git commit -m "your message"
```

6. Push to GitHub
```
git push -u origin master
```
 NOTE: Put your .tfvars and other sensitive or large files in .gitignore file locally before pushing to github

7. After this, your code will be on GitHub, and future pushes can just be:
```
git add .
git commit -m "your message"
git push -u origin master
```
 <img width="1381" height="361" alt="image" src="https://github.com/user-attachments/assets/46a5a3fd-2f9d-47ea-8d5a-4f919453df64" />

