pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('my-debian-web-server', '-f dockerfile .')
                }
            }
        }
        stage('Test') {
            steps {
                sh 'npm install'
                sh 'mocha tests'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d --name my-app -p 80:80 my-debian-web-server'
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
