pipeline {
   agent any
   environment 
    {
        VERSION = "v${BUILD_NUMBER}"
        PROJECT = 'spring3-app-pipeline'
        IMAGE = "$PROJECT:$VERSION"
        ECRURL = 'https://891377093016.dkr.ecr.ap-south-1.amazonaws.com/spring3-app-pipeline'
        ECRCRED = 'ecr:ap-south-1:aws_credentials'
    }   
    stages {
      stage('GetSCM') {

         steps {
            git credentialsId: 'github_credentials', url: 'https://github.com/jmstechhome28/spring3-mvc-maven-xml-hello-world.git'

         }
         }
	  stage('build'){
            steps{      
                sh "mvn package"
             }
         }
         stage('Image Build'){
             steps{
                 script{
				 
                       sh 'docker build -t $IMAGE .'
                 }
             }
         }
         stage('Push Image'){
         steps{
             script
                {
                    docker.withRegistry(ECRURL, ECRCRED)
                    {
                        docker.image(IMAGE).push()
                    }
                }
            }
         }
    }
    post
    {
        always
        {
            sh "docker rmi $IMAGE | true"
        }
    }
}
