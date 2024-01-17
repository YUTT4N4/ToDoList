pipeline {
    agent any

    stages {
        stage('Running') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                withCredentials([usernamePassword(credentialsId: 'yutt4n4', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    // This block ensures that the credentials are available for subsequent stages
                    // You can perform additional setup or validations here if needed
                }
            }
        }
        stage('Build Image') {
            steps {
                echo 'Building...'
                sh 'docker build -t yutt4n4/todolist .'
            }
        }
        stage('Push Image') {
            steps {
                echo 'Pushing...'
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                sh 'docker push yutt4n4/todolist:latest'
            }
        }
        stage('Deploy Container') {
            steps {
                echo 'Deploying...'
                sh 'docker stop django_todol || true'  // Stop the existing container if it's running
                sh 'docker rm django_todol || true'    // Remove the existing container if it exists
                sh 'docker run -d --name django_todol -p 8111:80 yutt4n4/todolist:latest'
            }
        }
    }

    triggers {
        pollSCM('* * * * *')
    }
}
