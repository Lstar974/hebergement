pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t mywebapp .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run mywebapp npm run test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'ansible-playbook deploy.yml'
            }
        }
    }
}
