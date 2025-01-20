FROM alpine:latest

RUN apk update && apk upgrade

###########################
## Setting up ssh server ##
###########################

RUN apk add openssh

RUN ssh-keygen -A

RUN sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config > /etc/ssh/tmp \
 && mv /etc/ssh/tmp /etc/ssh/sshd_config

RUN apk add nginx

#############################
## Installing Ansible deps ##
#############################

RUN apk add python3

RUN echo "root:test" | chpasswd

EXPOSE 80 22

CMD [ "/usr/sbin/sshd", "-D"]
