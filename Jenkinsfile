pipeline {
    agent any

    stages {
        stage('Build Docker image') {
            steps {
                sh 'docker build -t my-web-server .'
            }
        }
        
        stage('Deploy environment') {
            steps {
                ansiblePlaybook credentialsId: 'e3a09f7c-fbae-4ad2-9952-026fcd8d2aed', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts.yml', playbook: 'playbook.yml'
            }
        }
        
        stage('Test environment') {
            steps {
               sh 'docker run --rm -v /usr/bin/google-chrome:/usr/bin/google-chrome my-web-server /usr/bin/python3 /var/lib/jenkins/workspace/DevOps/test_selenium.py --no-sandbox'
            }
        }
        
        stage('Deploy web server') {
            steps {
                ansiblePlaybook credentialsId: 'e3a09f7c-fbae-4ad2-9952-026fcd8d2aed', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts.yml', playbook: 'deploy.yml'
            }
        }
    }
}
