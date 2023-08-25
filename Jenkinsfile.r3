pipeline {
    // agent { docker 'maven:3.5-alpine' }
    
  agent any
    
  tools {
    maven 'Maven 3.3.9'
    jdk 'jdk8'
  } 
    stages {
        stage ('Checkout') {
          steps {
            git 'https://github.com/abaer123/spring-petclinic.git'
          }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
                junit '**/target/surefire-reports/TEST-*.xml'
            }
        }
     }
 }
