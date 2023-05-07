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
               sh 'docker run --rm -v /usr/bin/google-chrome:/usr/bin/google-chrome my-web-server /usr/bin/python3 /var/lib/jenkins/workspace/DevOps/test_selenium.py --user-data-dir=/tmp'
            }
        }
        
        stage('Deploy web server') {
            steps {
                ansiblePlaybook become: true, playbook: 'deploy.yml'
            }
        }
    }
}
