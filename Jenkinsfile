pipeline {
  agent any

  stages {
    stage('Build image') {
      steps {
        script {
          dockerImage = docker.build("lstar974/hebergement")
        }
      }
    }
    stage('Push image') {
      steps {
        script {
          withDockerRegistry(credentialsId: 'docker') {
            dockerImage.push()
          }
        }
      }
    }
    stage('Deploy with Ansible') {
      steps {
        ansiblePlaybook credentialsId: 'ssh', inventory: 'hosts.yml', playbook: 'playbook.yml'
          }
      }
    }
    stage('Run Selenium tests') {
      steps {
        sh '/usr/bin/python3 /var/lib/jenkins/workspace/DevOps/test_selenium.py'
      }
    }
  }

  post {
    failure {
        mail to: 'lucas.buchle@gmail.com',
        subject: "Build failed in ${currentBuild.fullDisplayName}",
        body: '''<html>
                  <p>Hello,</p>
                  <p>The build ${currentBuild.fullDisplayName} has failed.</p>
                  <p>Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}#${env.BUILD_NUMBER}</a></p>
                  </html>''',
        mimeType: 'text/html'
    }
  }
