pipeline {
  agent any

  stages {
    stage('Build image') {
       dockerImage = docker.build("lstar974/hebergement")
    }
    stage('Push image') {
        withDockerRegistry(credentialsId: 'docker') {
        dockerImage.push()
        }
    stage('Deploy with Ansible') {
      steps {
        ansiblePlaybook credentialsId: 'ssh', inventory: 'hosts.yml', playbook: 'playbook.yml'
      }
    }
  }
}

