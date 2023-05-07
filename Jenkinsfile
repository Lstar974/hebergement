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
                ansiblePlaybook become: true, playbook: 'playbook.yml'
            }
        }
        
        stage('Test environment') {
            steps {
                sh 'docker run --rm -d -p 4444:4444 selenium/standalone-chrome:4.0.0-beta-4-prerelease-20211014'
                sh 'sleep 5'
                sh 'docker run --rm my-web-server /usr/bin/python3 /var/lib/jenkins/workspace/DevOps/test_selenium.py'
            }
        }
        
        stage('Deploy web server') {
            steps {
                ansiblePlaybook become: true, playbook: 'deploy.yml'
            }
        }
    }
}
