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
                    sh "curl -X PUT -H \"Authorization: token ${TOKEN}\" -d '{\"commit_title\": \"Merge pull request\"}' https://api.github.com/repos/${env.ghprbGhRepository}/pulls/${env.ghprbPullId}/merge"
                }
            }
        }
    }
}

