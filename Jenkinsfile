pipeline {
    agent { label 'docker-agent' }

    triggers { // <-- ADD THIS BLOCK
        githubPush() 
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ASasori/portfolio.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolio:latest .'
            }
        }

        stage('Security Scan (Trivy)') {
            steps {
                sh '''
                if ! command -v trivy &> /dev/null
                then
                    echo "Skipping scan: Trivy not installed"
                else
                    trivy image portfolio:latest || true
                fi
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker rm -f portfolio || true
                docker run -d --name portfolio -p 8085:80 portfolio:latest
                '''
            }
        }
    }
}
