FROM UBUNTU:18.04

## include update and install in same layer; this will help on mismatch of installed software versions
RUN apt update && apt install -y \
    sudo \
    vim \
    curl \
    net-tools \
    openjdk-8-jdk \
    software-properties-common

## add required repository to install python-3.8
RUN sudo add-apt-repository ppa:deadsnakes/ppa
RUN sudo apt update && apt install -y python3.8

## add required repository to install Node.js-V-12.X.X
RUN sudo curl -sL https://deb.nodesource.com/setup_12.x |sudo -E bash -
RUN sudo apt-get install -y nodejs

## add new user and create it's home directory 
RUN useradd testuser -m

## logic to create secret to switch between root user and new user
COPY rootsecret /tmp/
RUN /bin/bash /tmp/rootsecret && rm /tmp /rootsecret

## add entrypoint.sh to home directory
copy entrypoint.sh /home/testuser/

## give some permission to perform root level actions
RUN chmod 777 /etc/hosts
RUN chown -R testuser:testuser /home/testuser/
RUN echo 'testuser ALL=(ALL) /bin/su' >> /etc/sudoers

USER testuser
ENTRYPOINT [ /home/testuser/entrypoint.sh ]
