FROM alpine 

RUN apk add ansible gcc python3 py3-pip python3-dev libc-dev libffi-dev openssl-dev bash openssh-client
RUN pip3 install --upgrade paramiko
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash","/entrypoint.sh"]
