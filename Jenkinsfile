pipeline {
    agent any
    
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
        jdk "jdk17"
    }    
    
    environment {
		DOCKERHUB_CREDENTIALS=credentials('Docker-marko-token')
	} 
	
	
    stages {
        stage('Clean and clone'){
            stages{
                stage('Cleanup'){
                    steps{
                        echo 'Cleaning the environment...'
                        sh 'rm -Rf "${folderName}"'
                    }
                }
                stage('Clone'){
                    steps{
                         dir("${folderName}"){
                            withCredentials([sshUserPrivateKey(credentialsId: 'GitDenizRepo', keyFileVariable: 'SSH_KEY')]) {
                                echo 'Starting repository clone...'
                                sh 'GIT_SSH_COMMAND="ssh -i $SSH_KEY" git clone "${sshUrl}"'
                                echo 'Repository cloned...'
                             }
                        }
                        
                    }
                }
            }
            
        }
        stage('Build and test'){
            stages{
                stage('Enviroment check'){
                    steps{
                        sh '''
                            echo "PATH = ${PATH}"
                            echo "M2_HOME = ${M2_HOME}"
                            
                        '''
                        
                    }
                }
                stage('Build'){
                    steps{
                        dir("/var/lib/jenkins/workspace/ci-cd-pipeline/${folderName}/${repositoryName}"){
                          sh 'mvn -B -DskipTests clean package'  
                         }
                    }
                }
                stage('Test'){
                    steps{
                        dir("/var/lib/jenkins/workspace/ci-cd-pipeline/${folderName}/${repositoryName}"){
                            sh 'mvn test'
                         }
                    }
                }
            }
        }
        stage('Push to registry'){
            stages{
                stage('Initialize'){
                    steps{
                            sh '''
                                echo "PATH = ${PATH}"
                                echo "M2_HOME = ${M2_HOME}"
                            '''
                    }
                }
                stage('Login'){
                    steps{
                        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    }
                }
                stage('Build image'){
                    steps{
                        dir("/var/lib/jenkins/workspace/ci-cd-pipeline/${folderName}/${repositoryName}"){
                            sh 'docker build -t markorupnik/test_repo:latest .'
                        }
                    }
                }
                stage('Push'){
                    steps{
                        sh 'docker push markorupnik/test_repo:latest'
                    }
                }
            }
        }
    }
    post {
        always {
	        sh 'docker logout'
	        cleanWs()
        }
    }
}
