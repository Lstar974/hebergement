pipeline {
  agent any

  stages {
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t hebergement:tagname .'
        withDockerRegistry(credentialsId: 'docker') {
        dockerImage.push()
        }
        sh 'docker tag hebergement:tagname lstar974/hebergement:tagname'
        sh 'docker push lstar974/hebergement:tagname'
      }
    }
    stage('Deploy with Ansible') {
      steps {
        ansiblePlaybook credentialsId: 'ssh', inventory: 'hosts.yml', playbook: 'playbook.yml'
      }
    }
  }
}

