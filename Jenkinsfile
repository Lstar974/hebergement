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
        sh '/usr/bin/python3 /var/lib/jenkins/workspace/DevOps/test_selenium.py'
      }
    }
  }

  post {
    always {
      prometheus([
        jobName: 'DevOps',
        customJenkinsUrl: 'http://192.168.6.10:8080',
        customName: 'hebergement',
        includeRegexes: '.*',
        excludeRegexes: ''
      ])
    }
  }
}
