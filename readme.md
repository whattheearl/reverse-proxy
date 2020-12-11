# This is a test project testing docker for deployments to aws lightsail
This will deploy nginx as a reverse proxy to a local instance of express
this is intended to be a minimum deployment as well as a test environment

## 1. Install requirements for amazon linux2
- docker
- docker-compose
- git

`./scripts/setup_aws_linux2.sh`

## 1. Deploy reverse proxy with express api
ssh to machine

```
cd /express
docker-compose up -d
```