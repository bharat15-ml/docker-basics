# Docker-Basics
this repo include best practices requires to create docker files and related sample code.

step-1 : Create the required docker file with all necessary dependency and requirements.

step-2 : RUN the docker-build.sh to build and push a docker image to required repository. this script will take image name, tag and repository name as user parameter.

step-3: Once the docker image is built, use the k8s deployment file for deployment and start using it.

--------------------
## SECURITY GROUPS
--------------------
One additional note on Security group definition, it's need and how it works given below:-

1. runAsUser: On the configuration file, the runAsUser field specifies that for any Containers in the Pod, all processes run with user ID 1000. 
2. runAsGroup: The runAsGroup field specifies the primary group ID of 3000 for all processes within any containers of the Pod. If this field is omitted, the primary group ID of the containers will be root(0). Any files created will also be owned by user 1000 and group 3000 when runAsGroup is specified. 
3. fsGroup: Since fsGroup field is specified, all processes of the container are also part of the supplementary group ID 2000. The owner for volume /data/demo and any files created in that volume will be Group ID 2000.
