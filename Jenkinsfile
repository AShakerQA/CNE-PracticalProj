pipeline{
  agent any
  stages {
    stage('build front end and backend images'){
      steps {
        sh 'sudo su - jenkins'
        sh 'sudo usermod -aG docker jenkins'
        sh 'sudo docker build -t abdulshaker/backend ./backend/'
        sh 'sudo docker build -t abdulshaker/frontend ./frontend/'
        sh 'sudo docker build -t abdulshaker/database ./database/'
      }
    }
    stage('pytest automaton'){
      steps{
        sh 'chmod +x utility.sh'
        sh '. ./utility.sh'
      }
    }
    stage('push to dockerhub'){
      steps {
        sh 'sudo docker login -u abdulshaker -p Abdulshaker1234'
        sh 'sudo docker push abdulshaker/backend'
        sh 'sudo docker push abdulshaker/frontend'
        sh 'sudo docker push abdulshaker/database'
      }
    }
    stage ('deploying app using kubernetes'){
      steps{
        sh 'kubectl apply -f /var/lib/jenkins/workspace/JenkinsExample/kubernetes/secrets.yaml'
        sh 'kubectl apply -f /var/lib/jenkins/workspace/JenkinsExample/kubernetes/deploy.yaml'
        sh 'kubectl apply -f /var/lib/jenkins/workspace/JenkinsExample/kubernetes/nginx-lb.yaml'
        sh 'kubectl apply -f /var/lib/jenkins/workspace/JenkinsExample/kubernetes/configmap.yaml'
        sh 'kubectl apply -f /var/lib/jenkins/workspace/JenkinsExample/kubernetes/frontend.yaml'
        sh 'kubectl apply -f /var/lib/jenkins/workspace/JenkinsExample/kubernetes/backend.yaml'
        sh 'kubectl apply -f /var/lib/jenkins/workspace/JenkinsExample/kubernetes/mysql.yaml'
      }
    }

  }
}


