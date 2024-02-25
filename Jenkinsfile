pipeline {
environment {
registry = "dtalpas123/gohello_forjenkins"
registryCredential = 'dockerhub_id'
dockerImage = ''
}
agent any
options { skipDefaultCheckout() }        
stages {

        stage('Checkout Code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/DominikTalpas/go_jenkins_build.git']]])
            }
        }
stage('Cloning our Git') {
steps {
git 'https://github.com/DominikTalpas/go_jenkins_build.git'
}
}
stage('Building our image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
dockerImage.push()
}
}
}
}
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
}
}
