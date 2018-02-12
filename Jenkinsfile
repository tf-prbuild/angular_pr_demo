pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                sh 	'./deploy.sh demo_test docker_name'
            }
        }
        stage('D2D Tests') {
            steps {
                sauce('titus') {
                    sauceconnect(verboseLogging: true) {
                        sh './deploy_and_test.sh'
                    }
                }
               sh 'ruby check_if_func_test_needed.rb'
            }
        }
        stage ("Release") {
            steps {
                withCredentials([string(credentialsId: 'PAT', variable: 'TOKEN')]) {
                    sh "curl -X PUT -H 'Authorization: token ${TOKEN}' -d '{\"commit_title\": \"Merge pull request\"}' https://api.github.com/repos/${env.ghprbGhRepository}/pulls/${env.ghprbPullId}/merge"
                }
            }
        }
    }
}

