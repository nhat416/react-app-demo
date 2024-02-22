pipeline {
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
                    docker.withServer('tcp://docker-dind:2375') {
                        docker.build("nhat416/react-app-demo:latest")
                    }
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
            }
    }   }
}