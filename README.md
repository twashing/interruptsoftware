# Interruptsoftware

Source code repository for the site: Interruptsoftware.com

## Prerequisites

You will need [Leiningen][1] 1.7.0 or above installed.

[1]: https://github.com/technomancy/leiningen

## Running

To start a web server for the application, run:
```
lein ring server-headless
```

## Deployment

```
# Initialize terraform config
terraform init

# Apply terraform config to your Cloud provider
terraform apply

# Get the latest terraform config state
terraform state pull

# Get the latest Linux Amazon ECS-optimized AMIs
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#ecs-optimized-ami-linux
# https://aws.amazon.com/blogs/compute/query-for-the-latest-amazon-linux-ami-ids-using-aws-systems-manager-parameter-store/

AWS_ACCESS_KEY_ID=<aws_access_key_id> \
AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> \
aws ssm get-parameters --names /aws/service/ecs/optimized-ami/amazon-linux-2/recommended
```

## License

Copyright © 2013 FIXME
