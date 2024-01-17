pipeline {
    agent any

    stages {
        stage('Running') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                withCredentials([usernamePassword(credentialsId: 'mydjangoapp', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) 
            }
        }
        stage('Build Image') {
            steps {
                echo 'Building...'
                sh 'docker build -t your-dockerhub-username/your-image-name .'
            }
        }
        stage('Push Image') {
            steps {
                echo 'Testing...'                   
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                sh 'docker push your-dockerhub-username/your-image-name'
            }
        }
        stage('Deploy Container') {
            steps {
                echo 'Deploying...'
                sh 'docker run -d --name django_todol -p 8111:80 your-dockerhub-username/your-image-name'
            }
        }
    }

    triggers {
        pollSCM('* * * * *')
    }
}