FROM ubuntu

RUN apt-get update && apt-get install ruby -y
COPY ./scripts ./scripts
WORKDIR /scripts

CMD ["/bin/bash", "./run.sh"]
