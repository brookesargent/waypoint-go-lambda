project = "waypoint-go-lambda"

app "waypoint-go-lambda" {
  config {
    env = {
      "PRIVATE_SUBNET_IDS" = configdynamic("terraform-cloud", {
        organization = "pg-consumer-iot"
        workspace = "brooke-waypoint-test"
        output = "vpc_subnet_ids"
      })
    }
  }

  build {
    use "docker" {}

    registry {
      use "aws-ecr" {
        region = "us-east-1"
        repository = "waypoint-lambda-go"
        tag = "latest"
      }
    }
  }

  deploy {
    use "aws-lambda" {
      region = "us-east-1"
    }
  }

  release {
    use "aws-alb" {
    }
  }
}