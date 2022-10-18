pipeline {  
    environment {
        registry = "ridacap/flask-image"
        registryCredential = '5ba09b2b-7ad1-4566-a725-afa2898d165b'
        dockerImage = 'flask-image'
    }  
    agent any  
    stages {
        stage('CLoning Git') {
            steps {
                git 'https://github.com/FGooden/python-flask.git'        
            }
        }
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.ridacap( '', registryCredential ) {
                        dockerImage.push()  
                    }
                }
            }
        }
    }    
}
