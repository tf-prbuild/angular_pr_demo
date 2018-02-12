pipeline {
    agent any

    stages {
        stage('Setup') {
            steps {
                sh 'node --version'
                sh 'npm --version'
                sh 'npm install'
            }
        }
        stage('Static Code Analysis') {
            steps {
                sh 	'./node_modules/.bin/jshint controllers services views test specs *.js'
            }
        }
        stage('Unit Tests') {
            steps {
            	sh 'rm -rf old_coverage && git pull origin master && mv coverage old_coverage'
                sauce('titus') {
                    sauceconnect(verboseLogging: true) {
                        sh './node_modules/.bin/karma start karma.conf.js'
                    }
                }
                sh 'ruby code_coverage_checker.rb'
            }
        }
        stage('Functional Test') {
            steps {
                sauce('titus') {
                    sauceconnect(verboseLogging: true) {
                        sh './deploy_and_test.sh'
                    }
                }
               sh 'ruby check_if_func_test_needed.rb'
            }
        }
    }
}

