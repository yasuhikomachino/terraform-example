#  Terraform examples
Examples of Terraform on Docker.

## Environment
- Docker version 19.03.12, build 48a66213fe
- docker-compose version 1.26.2, build eefe0d31

## Stack
- AWS CLI 2.0.47
- Terraform 0.13.2

## Getting Started
```
$ git clone git@github.com:yasuhikomachino/terraform-example.git
$ cd terraform-example
$ docker-compose build
```

## Starts the terraform service and runs bash
```
$ docker-compose run --rm terraform bash
```

### Configures your profile
```
# aws configure --profile YOUR_PROFILE_NAME
AWS Access Key ID [None]: YOUR_AWS_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_AWS_SECRET_ACCESS_KEY
Default region name [None]: ap-northeast-1
Default output format [None]: json
```

Confirm the aws credential you set
```
# cat ~/.aws/credentials
```

## Changes directory to an example
```
# cd aws/single-instance/
```

### Builds infrastructure 
```
# terraform init
# terraform plan
# terraform apply
```