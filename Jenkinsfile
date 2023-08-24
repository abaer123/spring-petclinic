import groovy.json.*

   
   stage('Build') {
      steps {
           sh './mvn compile'
           sh './mvn test'
      }
   }
          

   stage('Deploy'){
    // deploy Pet-Clinic on port 8080
      java -jar target/*.jar
   }

   
  
