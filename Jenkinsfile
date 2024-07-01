pipeline {
    agent any

    environment {
        KUBECONFIG_CREDENTIALS_ID = 'kubeconfig'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/kaiopiterson/jsf'
            }
        }
        stage('Build JSF App') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t kaiopiterson/jsf-app .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'docker login -u kaiopiterson -p $DOCKERHUB_PASSWORD'
                    sh 'docker tag kaiopiterson/jsf-app kaiopiterson/jsf-app:latest'
                    sh 'docker push kaiopiterson/jsf-app:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: env.KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f deployment.yaml --kubeconfig=$KUBECONFIG'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
