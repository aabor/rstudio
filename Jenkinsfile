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
                sh /* CORRECT */ '''
                    docker-compose -f /home/$USER/docker/rstudio/docker-compose.yml up -d --remove-orphans
                '''
                mail    body: 'containers selenium, rstudio, rstudio-finance, rstudio-text started',
                        from: 'aaborochkin@gmail.com',
                        subject: 'rocker successfully rolled out',
                        to: 'aaborochkin@gmail.com'                
            }
        }
    }
}