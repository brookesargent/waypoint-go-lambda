FROM public.ecr.aws/lambda/ruby:2.7

COPY ./functions/handler.rb /var/task

CMD [ "handler.handler" ]