project = "waypoint-go-lambda"

app "waypoint-go-lambda" {
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