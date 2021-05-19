require 'json'

def handler(event:, context:)
    qs = event.fetch("queryStringParameters", {})

    name = qs.fetch("name", "human")

    STDERR.puts "Handling ALB request for #{name}"

    {
        "statusCode": 200,
        "statusDescription": "200 OK",
        "isBase64Encoded": false,
        "headers": {
            "Content-Type": "text/html"
        },
        "body": "<html><body><h1>Hello #{name} from AWS Lambda deployed by Waypoint!</h1></html></body>"
    }
end
