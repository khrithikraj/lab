pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // This checks out the code from your Git repository
                git branch: 'main', url: 'https://github.com/khrithikraj/lab.git'
            }
        }

        stage('Build') {
            steps {
                // This installs dependencies and builds the project
                script {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Docker Build') {
            steps {
                // This builds your Docker image from the Dockerfile
                script {
                    sh 'docker build -t frontend-prod .'
                }
            }
        }

        stage('Docker Run') {
            steps {
                // This runs the Docker container (you can change port if needed)
                script {
                    sh 'docker run -d -p 8081:80 frontend-prod'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
