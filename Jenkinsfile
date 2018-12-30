pipeline {
    agent any
    stages {
        stage('Build') {
            environment { 
                USER=credentials('jenkins-current-user')
                DOCKER_CREDS=credentials('jenkins-docker-cred')
                RSTUDIO_COMMON_CREDS = credentials('jenkins-rstudio-common-creds')
            }            
            steps {
                echo 'Building..'
                sh 'docker-compose -f /home/$USER/docker/rstudio/docker-compose.yml build'
                echo 'login to docker'
                sh 'docker login -u $DOCKER_CREDS_USR  -p $DOCKER_CREDS_PSW'
                echo 'Pushing images to docker hub'
                sh 'docker push aabor/rstudio:latest'
                sh 'docker push aabor/rstudio-finance:latest'
                sh 'docker push aabor/rstudio-text:latest'
                }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            environment { 
                USER=credentials('jenkins-current-user')
                RSTUDIO_COMMON_CREDS = credentials('jenkins-rstudio-common-creds')
            }            
            steps {
                echo 'Deploying....'
                sh '''
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