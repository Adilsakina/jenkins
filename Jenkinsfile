pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ECR_REPO = '050752608507.dkr.ecr.ap-south-1.amazonaws.com/sakinashfaq/dockrepo'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Adilsakina/jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $ECR_REPO:docker .'
                }
            }
        }

        stage('Login to AWS ECR') {
            steps {
                withAWS(credentials: 'aws_credentials', region: AWS_REGION) {
                    script {
                        
                        sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO'
                    }
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    
                    sh 'docker push $ECR_REPO:docker'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker run -itd $ECR_REPO:docker'
                }
            }
        }
    }
}

