pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-web-server .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm my-web-server ansible-playbook -i inventory.ini playbook.yml'
            }
            post {
                success {
                    echo 'The web server is working correctly.'
                }
                failure {
                    echo 'The web server is not working correctly.'
                }
            }
        }
    }
}
