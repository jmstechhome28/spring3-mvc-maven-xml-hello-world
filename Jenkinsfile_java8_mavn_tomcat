  pipeline{
    agent any
	tools {
        maven "maven3"
        jdk "java8"
    }
 stages{
   stage('clone'){
       steps{
	   git changelog: false, credentialsId: 'github_credentials', poll: false, url: 'https://github.com/jmstechhome28/spring3-mvc-maven-xml-hello-world.git'
       }
    }
	stage('build'){
     steps{
	    sh "mvn clean package"
       }
    }
    stage('deploy'){
     steps{
	 withCredentials([usernameColonPassword(credentialsId: 'tomcat_credentails', variable: 'tomcatcreds')]) {

         sh "curl -v -u $tomcatcreds -T /var/lib/jenkins/workspace/git_maven_tomcat_pipeline/target/spring3-mvc-maven-xml-hello-world-1.4.war 'http://ec2-13-232-158-170.ap-south-1.compute.amazonaws.com:8080/manager/text/deploy?path=/sprinapp2&update=true'"
       }
	   }
    }
  }
  }
