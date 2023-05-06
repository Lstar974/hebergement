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
                ansiblePlaybook credentialsId: 'ssh', disableHostKeyChecking: true, inventory: 'hosts.yml', playbook: 'playbook.yml'
            }
        }
    }
}
