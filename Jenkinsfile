import groovy.json.*

   
   stage('Build') {
           sh "./mvnw package"
   }
          

   stage('Deploy'){
    // deploy Pet-Clinic on port 8080
      java -jar target/*.jar
   }

   
  
