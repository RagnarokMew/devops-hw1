# DevOps Course HW1

## Synopsis

A docker container is treated as a managed node made with the Dockerfile, that has Ansible requirements installed. Using the ansible playbook a repo containing a webpage is cloned into the managed node, an nginx server is set up and deployed.

## Requirements

- ansible
- docker
- ssh key

## How to run

1. Clone the repository
2. Change Dockerfile to contain the path to your public key (or comment said line)
3. Build the Dockerfile
4. Create a docker container with the image and bind 2222 (host) to 22 (container) and 8080 (host) to 80 (container)
    * Copy your public key to the container if you commented the authorized_key line
5. Run the playbook with ```ansible-playbook playbook.yml -i inventory.yml```
6. (Optional) Checkout ```http://localhost:8080/```