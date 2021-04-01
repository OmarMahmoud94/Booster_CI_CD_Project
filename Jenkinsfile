pipeline {
  agent {label 'ubunto'}

  stages {     
     stage('Build') {
           steps {
                  sh 'docker build . -t omarquraah/django_app_dev:lts'
           }
           post {
                   success {
                     slackSend(color: "33FFF3" , message:"DEV: build succeeded")
                   }
           }

        
     }
     
     stage('push') {
           steps {
                 withCredentials([usernamePassword(credentialsId: "docker-hub", usernameVariable: "username", passwordVariable: "pass")]) {
                 sh 'docker login -u $username -p $pass '
                 sh 'docker push omarquraah/django_app_dev:lts'
                 }    
           }
           post {
                   success {
                     slackSend(color: "33FFF3" , message:"DEV: push succeeded")
                   }
           }

         
     }
  
     stage('deploy') {
           steps {
              sh 'docker container run -d -p 3000:8000 omarquraah/django_app_dev:lts'
             
           }
           post {
                   success {
                     slackSend(color: "33FFF3" , message:"DEV: deplyment succeeded")
                   }
           }
     }
  }
}

