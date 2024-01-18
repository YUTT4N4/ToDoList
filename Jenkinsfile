pipeline {
  agent any
  stages {
    stage('Check Repository') {
      steps {
        git 'https://github.com/YUTT4N4/ToDoList.git'
      }
    }
    stage('Build Image') {
      steps {
        docker build -t todolist:latest .
      }
    }
    stage('Push Image') {
      steps {
        docker push yutt4n4/todolist:latest
      }
    }
    stage('Deploy Image') {
      steps {
        docker pull yutt4n4/todolist:latest
      }
    }
    stage('Run Containerization') {
      steps {
        docker run -d -p 8111:80 todolist
      }
    }
  }
}