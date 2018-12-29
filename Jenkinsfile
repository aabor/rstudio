pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'

            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            environment { 
                RSTUDIO_COMMON_CREDS = credentials('jenkins-rstudio-common-creds')
            }            
            steps {
                echo 'Deploying....'
                """${sh(
                    docker-compose up -df --remove-orphans
                )}"""
            }
            steps {
                mail    body: 'containers selenium, rstudio, rstudio-finance, rstudio-text started',
                        from: 'aaborochkin@gmail.com',
                        subject: 'rocker successfully rolled out',
                        to: 'aaborochkin@gmail.com'                
            }
        }
    }
}