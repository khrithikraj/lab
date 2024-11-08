pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'frontend-prod'  // Set a variable for the Docker image name
    }

    stages {
        // Stage for checking out the code from GitHub
        stage('Checkout') {
            steps {
                git 'https://github.com/khrithikraj/lab.git'
            }
        }

        // Stage for building the application (e.g., run npm, maven, etc.)
        stage('Build') {
            steps {
                script {
                    echo 'Building the app...'
                    // If you have a build command like npm install or maven clean install, include it here
                    // Example:
                    // sh 'npm install'
                }
            }
        }

        // Stage for building the Docker image
        stage('Docker Build') {
            steps {
                script {
                    echo 'Building Docker image...'
                    // Ensure Docker is available on the Jenkins agent machine
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        // Stage for running the Docker container
        stage('Run Docker Container') {
            steps {
                script {
                    echo 'Running Docker container...'
                    // Run the Docker container in detached mode and expose the port
                    // Ensure that Docker is running on the Jenkins agent and has access to the Docker daemon
                    sh 'docker run -d -p 8081:80 $DOCKER_IMAGE'
                }
            }
        }

        // Optional: Stage for cleaning up Docker containers/images
        stage('Cleanup') {
            steps {
                script {
                    echo 'Cleaning up Docker containers and images...'
                    sh 'docker ps -q | xargs docker stop'   // Stops all running containers
                    sh 'docker ps -a -q | xargs docker rm'  // Removes all stopped containers
                    sh 'docker images -q | xargs docker rmi' // Removes all images (use with caution)
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for errors.'
        }
    }
}
