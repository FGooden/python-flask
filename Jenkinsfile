pipeline {  
    environment {
        registry = "ridacap/flask-image"
        registryCredential = '5ba09b2b-7ad1-4566-a725-afa2898d165b'
  }  
    agent any  
    stages {
        stage('Building image') {
            steps{
                script {
                     docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
