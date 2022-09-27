pipeline {
    agent any

    stages {
        stage('Checkout branch') {
            steps {
                git(
                    url: 'git@github.com:deniz2412/DevOpsModuleSampleApp.git',
                    credentialsId: 'GitDeniz',
                    branch: "$branch"
                    )
                echo 'Branch $branch checked'
            }
        }
    }
}
