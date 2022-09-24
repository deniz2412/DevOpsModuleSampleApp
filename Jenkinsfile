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

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    echo 'post main good'
                }
            }
        }
    }
}
