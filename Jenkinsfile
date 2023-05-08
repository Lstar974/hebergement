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
    stage('Run Selenium tests') {
      steps {
        sh "pip install selenium"
        sh "python /var/lib/jenkins/workspace/DevOps/test_selenium.py"
      }
    }
  }
}
