pipeline {
  agent {label 'ubunto'}

  stages {     
     stage('Build') {
           steps {
                  sh 'docker build . -t omarquraah/django_app:lts'
           }

           post {
                   success {
                     slackSend(color: "33FFF3" , message:"build succeeded")
                   }
           }
     }
     
     stage('push') {
           steps {
                 withCredentials([usernamePassword(credentialsId: "docker_hub", usernameVariable: "username", passwordVariable: "pass")]) {
                 sh 'docker login -u $username -p $pass '
                 sh 'docker push omarquraah/django_app:lts'
                 }    
           }

           post {
                   success {
                     slackSend(color: "33FFF3" , message:"push to docker-hub succeeded")
                   }
           }
     }
  
     stage('deploy') {
           steps {
              sh 'docker container run -d -p 3000:3000 omarquraah/nodejsapp:lts'
             
           }
            post {
                   success {
                     slackSend(color: "33FFF3" , message:"deployment succeeded")
                   }
           }
     }
  }
}

