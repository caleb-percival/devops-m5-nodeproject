pipeline {
    agent any
    stages {
        stage('Clean Up') {
            steps {
                sh "echo 'Cleaning up'"
                sh 'docker rm -f $(docker ps -aq) || true' 

           }
        }
        stage('Setup') {
            steps {
                sh "echo 'Creating network'"
                sh "docker network create node-network || true"
            }
        }
        stage('Docker build') {
            steps {
                sh 'docker build -t node-app -f Dockerfile .'
                sh 'docker build -t nginx -f Dockerfile.nginx .'
            }
        }
        stage('Docker run') {
            steps {
                sh 'docker run -d --name node-app --network node-network node-app'
                sh 'docker run -d --name nginx -p 80:80 --network node-network nginx'
            }
        }
    }
}
