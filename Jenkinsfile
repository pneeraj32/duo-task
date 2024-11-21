pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t neeraj870/duo-jenk:latest -t neeraj870/duo-jenk:v${BUILD_NUMBER} .
                '''
            }
        }
        stage('Push') {
            steps {
                sh '''
                docker push neeraj870/duo-jenk:latest
                docker push neeraj870/duo-jenk:v${BUILD_NUMBER}
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh'''
                kubectl apply -f ./k8s
                kubectl set image deployment/flask-deployment flask-container=neeraj870/duo-jenk:v${BUILD_NUMBER}
                '''
            }
        }
    }
}
