pipeline {
    environment {
        registry = "nhat416/react-app-demo"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                script {
                    dockerImage_latest = docker.build registry + ":latest"
                    dockerImage_no = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Test') {
            steps {
                echo "Testing..."
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying..."
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage_latest.push()
                        dockerImage_no.push()
                    }
                }
            }
       }
       stage('Clean up') {
           steps {
               echo 'Cleaning up...'
               sh 'docker rmi $registry:$BUILD_NUMBER'
           }
       }
   }
}