pipeline{
  agent any
  stages {
    stage('build front end and backend images'){
      steps {
      sh 'sudo docker build -t abdulshaker/backend ./backend/'
      sh 'sudo docker build -t abdulshaker/frontend ./frontend/'
      sh 'sudo docker build -t abdulshaker/database ./database/'
      }
    }
    stage('push to dockerhub'){
      sh 'sudo docker login -u abdulshaker -p ${password}'
      sh 'sudo docker push abdulshaker/backend'
      sh 'sudo docker push abdulshaker/frontend'
      sh 'sudo docker push abdulshaker/database'
    }
  }
}
