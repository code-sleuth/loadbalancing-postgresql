# Load balancing postgresql database

Postgres is the database application and i'll be using Haproxy as the load balancer. I use Packer for configuration management and GCP as the cloud provider.

#### Create base images using packer

clone the repository, export the service account key, and the GCP project id. Also fill in the appropriate variables in the `.env` file.

```
git clone https://github.com/code-sleuth/loadbalancing-postgresql.git
cd postgres-loadbalancing
export SERVICE_ACCOUNT_PATH="path_to_service_account"
export PROJECT_ID="GCP_project_id"
```

create the Haproxy image

```
cd images/haproxy/
# validate the script
packer validate haproxy.json
# build the image
packer build haproxy.json
```


create the master image

```
cd images/master/
# validate the script
packer validate master.json
# build the image
packer build master.json
```


create the slave images

```
cd images/haproxy/
# validate the script
packer validate slave.json
# build the image
packer build slave.json
```

#### Setup infrastructure on GCP

change the directory to the terraform and run the following commands

```
cd terraform
# initialize terraform
terraform init
# view the plan
terraform plan
# build the resources
terraform apply
```
