pipeline {
    agent any

    stages {
        stage('Build Main') {
            when{
                branch "main"
            }
            steps {
                echo 'Build main and only main'
            }
        }
        stage("Testing Main"){
            when{
                branch "main"
            }
            parallel{
            steps{
                echo "Testing"
            
            }

            }

           

        }

    }
}
