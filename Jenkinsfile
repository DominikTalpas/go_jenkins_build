pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh 'go build goapp/main.go'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
    }
}
