pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                sh 'npm install'
            }
        }
        stage ("Release") {
            steps {
                withCredentials([string(credentialsId: 'ghpat', variable: 'TOKEN')]) {
                    sh "ruby merge_it.rb ${TOKEN} https://api.github.com/repos/${env.ghprbGhRepository}/pulls/${env.ghprbPullId}/merge"
                }
            }
        }
    }
}

