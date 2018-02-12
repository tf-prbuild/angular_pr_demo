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
            sauce('titus') {
                sauceconnect(verboseLogging: true) {
                    parallel {
                        stage('Windows and Chrome') {
                            sh 'ruby ./d2d_test.rb win10_chrome'
                        }
                        stage('Windows 10 and IE') {
                            sh 'ruby ./d2d_test.rb win10_ie'
                        }
                        stage('Windows 8 and IE') {
                            sh 'ruby ./d2d_test.rb win8_ie'
                        }
                        stage('Mac and Firefox') {
                            sh 'ruby ./d2d_test.rb mac12_firefox'
                        }
                    }
                }
            }
           sh 'ruby check_if_func_test_needed.rb'
        }
        stage ("Release") {
            steps {
                withCredentials([string(credentialsId: 'ghpat', variable: 'TOKEN')]) {
                    sh echo "No Auto Merge right now"
//                    sh "ruby merge_it.rb ${TOKEN} https://api.github.com/repos/${env.ghprbGhRepository}/pulls/${env.ghprbPullId}/merge"
                }
            }
        }
    }
}

