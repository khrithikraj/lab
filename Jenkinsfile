pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/khrithikraj/lab.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    echo 'Building the app...'
                    // Add any build steps like npm or maven commands here
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t frontend-prod .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    echo 'Running Docker container...'
                    sh 'docker run -d -p 8081:80 frontend-prod'
                }
            }
        }
    }
}
