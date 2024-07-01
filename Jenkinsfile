pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Construir projeto JSF
                    dir('path-to-jsf-project') {
                        sh 'mvn clean package'
                    }
                }
            }
        }
        stage('Build Docker Images') {
            steps {
                script {
                    // Construir imagem Docker para o projeto JSF
                    dir('path-to-jsf-project') {
                        sh 'docker build -t jsf-app .'
						}
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Executar contêiner Docker para o projeto JSF
                    sh 'docker run -d -p 8081:8080 jsf-app'
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
