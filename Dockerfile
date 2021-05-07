FROM golang:1.14 as build-image

WORKDIR /go/src
COPY ./functions/go.mod ./functions/helloWorld.go ./

RUN go build -o ../bin

# copy artifacts to a clean image
FROM public.ecr.aws/lambda/go:1
COPY --from=build-image /go/bin/ /var/task/

# Command can be overwritten by providing a different command in the template directly.
CMD ["helloWorld"]