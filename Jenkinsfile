pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                sh 'npm install'
            }
        }
        stage('Unit Tests') {
            steps {
            	sh 'echo "running static code check"'
                sh 	'./node_modules/.bin/jshint controllers services views test specs *.js'

            	sh 'echo "deleting old code coverage"'
                sh 'rm -rf old_coverage && git pull origin master && mv coverage old_coverage'

            	sh 'echo "running Unit Tests"'
                sauce('titus') {
                    sauceconnect(verboseLogging: true) {
                        sh './node_modules/.bin/karma start karma.conf.js'
                    }
                }

            	sh 'echo "Running Code Coverage"'
                sh 'ruby code_coverage_checker.rb'
            }
        }

        stage('Build') {
            steps {
                sh 	'./build.sh demo_test docker_name'
            }
        }
        stage('D2D Tests') {
            steps {
                sauce('titus') {
                    sauceconnect(verboseLogging: true) {
                        sh './d2d_test.sh'
                    }
                }
               sh 'ruby check_if_func_test_needed.rb'
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

