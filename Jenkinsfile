import groovy.json.*

node () {
   def mvnHome, commitId
    
   stage('Preparation') { // for display purposes
      // Get code from a GitHub repository
      // git 'git@github.com:abaer123/spring-petclinic.git'
      checkout scm   
   }

   
   stage('Build') {
      // Run the maven build
      try{
        if (isUnix()) {
          // sh "./mvnw  -B -Dmaven.test.failure.ignore -Drat.skip=true -f pom.xml clean package -U"
           sh "./mvnw package"
        } else {
          // bat(/mvnw.cmd -B -Dmaven.test.failure.ignore -Drat.skip=true clean package/)
           bat(/mvnw.cmd package/)
        }
        
        currentBuild.result = 'BUILD IS GREAT SUCCESS'

      }catch(Exception err){
        currentBuild.result = 'BUMMER. BUILD FAILED.'
      
      }

      
      sh "echo current build status ${currentBuild.result}"
      /*
      if (currentBuild.result == 'FAILURE') {
        postGitHub(commitId, 'failure', 'build', 'Build failed')
        return
        } else {
          postGitHub(commitId, 'success', 'build', 'Build succeeded')
        } */
      
      }


   stage('Deploy'){
    // deploy Pet-Clinic on port 8080
      java -jar target/*.jar
    }

   
//    stage('Lifecycle Evaluation'){
//     // postGitHub commitId, 'pending', 'analysis', 'Nexus Lifecycle Analysis is running'

//       def policyEvaluationResult = nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: 'struts2-rce', iqStage: 'stage-release', jobCredentialsId: ''
//     /*  if (currentBuild.result == 'FAILURE'){
//         postGitHub commitId, 'failure', 'analysis', 'Nexus Lifecycle Analysis failed',"${policyEvaluationResult.applicationCompositionReportUrl}"
//         return
//       } else {
//         postGitHub commitId, 'success', 'analysis', 'Nexus Lifecycle Analysis succeeded',"${policyEvaluationResult.applicationCompositionReportUrl}"
//       } */
//    }
   
// }

def postGitHub(commitId, state, context, description, target_url="http://localhost:8080") {
         def payload = JsonOutput.toJson(
           state: state,
           context: context,
           description: description,
           target_url: target_url
          )
        sh "curl -H \"Authorization: token ${gitHubApiToken}\" --request POST --data '${payload}' https://api.github.com/repos/${project}/statuses/${commitId}"
}
  
