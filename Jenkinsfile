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
                sh 'docker run --rm my-web-server python /var/lib/jenkins/workspace/DevOps/test_selenium.py'
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
