pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Adilsakina/jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t 050752608507.dkr.ecr.ap-south-1.amazonaws.com/sakinashfaq/dockrepo:docker .'
            }
        }
        stage('login to ECR') {
            steps {
                sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 050752608507.dkr.ecr.ap-south-1.amazonaws.com'
            }
        }
        stage('Push to ECR') {
            steps {
                sh 'docker push 050752608507.dkr.ecr.ap-south-1.amazonaws.com/sakinashfaq/dockrepo:docker'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -itd 050752608507.dkr.ecr.ap-south-1.amazonaws.com/sakinashfaq/dockrepo:docker'
            }
        }
    }
}
