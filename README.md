# Assignment on Terraform and Ansible

## Part-1 Creating Infrastructure using Terraform
```
Total 4 files : 
     Provider.tf  --> AWS Setup and Terraform Initialization
     vpc.tf --> Creating vpc, public and private subnets, eip, nat gateway, route tables and its associations recepectively
     sg-iam.tf --> creating security groups and iam role for ec2 vms
     instance.tf --> creating 2 instances for web and db servers
     output.tf --> Resource Output for both instnaces
```

### Execution Steps:
1. Initialize Terraform:
  ```
    terraform init
  ```
2. Validate the configuration:
```
   terraform validate
```
3. Apply the configuration:
```
   terraform apply --auto-approve
    
Outputs:

db_server_private_ip = "10.0.2.244"
web_server_public_ip = "52.25.128.71"
```

## Part-2 Deploying the NodeJS application and DB using Ansible
1. In Inventory.ini file, added servers host names to communicate 
2. From web_server.yaml instlling nodejs related packages and cloneing the repo
```
   ansible-playbook -i inventory-ini web-server.yaml
```
3. Now deploying the DB server usingh db_server.yaml
```
   ansible-playbook -i inventory-ini db_server.yaml
```
4. using deploy.yaml file creating .env file in nodejs application folder and starting the node app
```
  ansible-playbook -i inventory-ini deploy.yaml
```
5. For extra security purpose adding firewall rules
```ansible-playbook -i inventory-ini security.yaml
```
