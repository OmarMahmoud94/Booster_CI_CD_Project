FROM ubuntu 
USER root 
RUN mkdir -p jenkins_home
RUN chmod 777 jenkins_home 
RUN apt-get update -qq 
RUN apt-get install openjdk-8-jdk -qq
RUN apt-get install openssh-server -qq
RUN apt-get install -qqy apt-transport-https ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get update -qq && apt-get install -y docker-ce  
RUN useradd -ms /bin/bash jenkins
RUN usermod -aG docker jenkins 
USER jenkins 
RUN mkdir ~/.ssh
COPY authorized_keys /home/jenkins/.ssh 
USER root
RUN chmod 777 /home/jenkins/.ssh/authorized_keys 
CMD chmod 777 /var/run/docker.sock;service ssh start;bash
 
