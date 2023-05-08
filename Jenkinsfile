pipeline {
  agent any

  stages {
    stage('Build Docker Image') {
       withDockerRegistry(credentialsId: 'docker') {
        dockerImage.push()
        }
      steps {
        sh 'docker build -t hebergement:tagname .'
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

