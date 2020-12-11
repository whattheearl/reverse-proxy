# This is a test project testing docker for deployments to aws lightsail
This will deploy nginx as a reverse proxy to a local instance of express
this is intended to be a minimum deployment as well as a test environment

## Setup
1. Deploy lightsail amazon linux 2 instance

1. Install requirements for amazon linux2
    - docker
    - docker-compose
    - git

    copy script or install git and clone repo
    `./scripts/setup_aws_linux2.sh`

1. Deploy reverse proxy with express api
    ```
    ./express/scripts/deploy.sh
    ```