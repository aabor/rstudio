pipeline {
    agent any
    stages {
        stage('Build') {
            environment { 
                USER=credentials('jenkins-current-user')
                DOCKER_CREDS=credentials('jenkins-docker-credentials')
                RSTUDIO_COMMON_CREDS = credentials('jenkins-rstudio-common-creds')
                MONGO_COMMON_CREDS = credentials('jenkins-mongo-common-creds')
                MONGO_FHQ = credentials('jenkins-mongo-fh-creds')
                FLASK_SECRET_KEY = credentials('fh-flask-secret-key')
            }            
            steps {
                labelledShell label: 'Building and tagging docker images...', script: '''
                    export GIT_VERSION=$(git describe --tags | sed s/v//)
                    #docker-compose down --remove-orphans
                    docker-compose build
                    docker tag $USER/rstudio:latest $USER/rstudio:$GIT_VERSION
                    docker tag $USER/rstudio-finance:latest $USER/rstudio-finance:$GIT_VERSION
                    docker tag $USER/rstudio-text:latest $USER/rstudio-text:$GIT_VERSION
                    docker system prune -f # remove orphan containers, volumes, networks and images
                    # recreate networks after system pruning
                '''
                labelledShell label: 'Pushing images to docker registry...', script: '''
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
            }
            post {
                always{
                    cleanWs()
                    emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                        recipientProviders: [[$class: 'DevelopersRecipientProvider'], 
                        [$class: 'RequesterRecipientProvider']],
                        subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
                }
            }
        }
    }
}
