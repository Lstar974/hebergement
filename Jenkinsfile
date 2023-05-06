pipeline {
    agent {
        docker {
            image 'my-debian-web-server'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm run test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'npm run build'
                sh 'cp -r ./dist /var/www/html'
                sh 'systemctl reload apache2'
                sh 'newrelic-infra start'
                sh 'sonar-scanner'
            }
        }
    }
    post {
        always {
            junit '**/test-results/*.xml'
        }
        success {
            slackSend (color: '#00FF00', message: "Le build de l'application a réussi!")
        }
        failure {
            mail body: "Le build de l'application a échoué.", subject: "Build failure", to: "devops@example.com"
        }
    }
}
