FROM alpine:latest

RUN apk update && apk upgrade

###########################
## Setting up ssh server ##
###########################

RUN apk add openssh

RUN ssh-keygen -A

# Replace ./id_ed25519.pub with the path to your public key
COPY ./id_ed25519.pub /root/.ssh/authorized_keys

#############################
## Installing Ansible deps ##
#############################

RUN apk add python3

###################
## Exposed ports ##
###################

EXPOSE 80 22

###################
## Starting sshd ## 
###################

CMD [ "/usr/sbin/sshd", "-D"]
