pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t mywebapp .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'ansible-playbook playbook.yml'
            }
        }
    }
}
