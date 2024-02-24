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
        stage('Build Docker Image') {
            when {
                branch 'main'
            }
            steps {
                script {
                    app = docker.build("dtalpas123/gobuildjenkins")
                    app.inside {
                        sh 'echo $(curl localhost:8081)'
                    }
                }
            }
        }
    }
}
