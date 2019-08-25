pipeline {
    agent any
    stages {
        stage('Build') {
            environment { 
                USER=credentials('jenkins-current-user')
                DOCKER_CREDS=credentials('jenkins-docker-credentials')
                RSTUDIO_COMMON_CREDS = credentials('jenkins-rstudio-common-creds')
            }            
            steps {
                echo 'Building and tagging..'
                sh '''
                    export GIT_VERSION=$(git describe --tags | sed s/v//)
                    docker-compose build
                    docker tag $USER/rstudio:latest $USER/rstudio:$GIT_VERSION
                    docker tag $USER/rstudio-finance:latest $USER/rstudio-finance:$GIT_VERSION
                    docker tag $USER/rstudio-text:latest $USER/rstudio-text:$GIT_VERSION
                    docker system prune -f
                '''
                echo 'Pushing images..'
                sh '''
                    echo 'login to docker'
                    docker login -u $DOCKER_CREDS_USR  -p $DOCKER_CREDS_PSW
                    export GIT_VERSION=$(git describe --tags | sed s/v//)
                    echo $GIT_VERSION
                    echo "Pushing rstudio:$GIT_VERSION to docker hub"
                    docker push aabor/rstudio:$GIT_VERSION
                    docker push aabor/rstudio:latest
                    echo "Pushing rstudio-finance:$GIT_VERSION to docker hub"
                    docker push aabor/rstudio-finance:$GIT_VERSION
                    docker push aabor/rstudio-finance:latest
                    echo "Pushing rstudio-text:$GIT_VERSION to docker hub"
                    docker push aabor/rstudio-text:$GIT_VERSION
                    docker push aabor/rstudio-text:latest
                '''
                echo "starting docker containers"
                sh'''
                    docker network create selenium-hub
                    docker network create front-end
                    docker-compose up -d --remove-orphans
                '''
                mail    body: 'containers rstudio, rstudio-finance, rstudio-text started',
                        from: 'aaborochkin@gmail.com',
                        subject: 'rocker successfully rolled out',
                        to: 'aaborochkin@gmail.com'  
            }
            post {
                always{
                    cleanWs()
                    sh '''
                        pwd
                        ls
                        echo "Finishing.."
                    '''
                }
            }
        }
    }
}
