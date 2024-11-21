pipeline {
    agent any
    stages {
        stage('Init') {
            steps {
                script{
                    if(env.GIT_BRANCH == 'origin/main'){
                        sh '''
                        kubectl create ns prod || echo "------Prod Namespace Already Exists-------"
                        '''
                    } else if (env.GIT_BRANCH == 'origin/dev') {
                        sh '''
                        kubectl create ns dev || echo "--------Dev Namespace Already Exists"
                        '''
                    } else {
                        sh'echo "Unrecognised branch"'
                    }
                }
            }
        }      
        stage('Build') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/main') {
                        sh '''
                        docker build -t stratcastor/duo-jenk:latest -t stratcastor/duo-jenk:v${BUILD_NUMBER} .
                        '''
                    } else if (env.GIT_BRANCH == 'origin/dev') {
                        sh '''
                        docker build -t stratcastor/duo-jenk:latest -t stratcastor/duo-jenk:v${BUILD_NUMBER} .
                        '''
                    } else {
                        sh'echo "Unrecognised branch"'
                    }
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/main') {
                        sh '''
                        docker push neeraj870/duo-jenk:latest
                        docker push neeraj870/duo-jenk:v${BUILD_NUMBER}
                        '''
                    } else if (env.GIT_BRANCH == 'origin/dev') {
                        sh '''
                        docker push neeraj870/duo-jenk:latest
                        docker push neeraj870/duo-jenk:v${BUILD_NUMBER}
                        '''
                    } else {
                        sh'echo "Unrecognised branch"'
                    }
                }    
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/main') {
                        sh '''
                        kubectl apply -f ./k8s
                        kubectl set image deployment/flask-deployment flask-container=neeraj870/duo-jenk:v${BUILD_NUMBER}
                        '''
                    } else if (env.GIT_BRANCH == 'origin/dev') {
                        sh'''
                        kubectl apply -f ./k8s
                        kubectl set image deployment/flask-deployment flask-container=neeraj870/duo-jenk:v${BUILD_NUMBER}
                        '''
                    } else {
                        sh'echo "Unrecognised branch"'
                    }
                }
            }
        }
    }
}