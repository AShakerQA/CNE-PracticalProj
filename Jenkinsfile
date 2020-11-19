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
  }
}
