package main

import (
	"context"
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
)

type Event struct {
	Name string `json:"name"`
}

func handler(ctx context.Context, name Event) (string, error) {
	if name.Name == "" {
		name.Name = "human"
	}
	helloStatement := fmt.Sprintf("Hello %s!", name.Name)
	fmt.Println(helloStatement)
	return helloStatement, nil
}

func main() {
	lambda.Start(handler)
}
