@Library("centreon-shared-library") _

pipeline {
  agent any
  stages {
    stage('Source code analysis') {
      parallel {
        stage('Sonarqube analysis') {
          agent any
          steps {
            echo "Analyse go modules"
            withSonarQubeEnv('SonarQubeDev') {
              //sh 'docker run -i -v "$PWD:/src" -w="/src" --entrypoint ci/go-modules-analysis.sh --rm -u $(id -u):$(id -g) sonarsource/sonar-scanner-cli:latest "$SONAR_AUTH_TOKEN" "$SONAR_HOST_URL"'
              sh 'docker run -i -v "$PWD:/src" --entrypoint /src/ci/go-modules-analysis.sh --rm -u $(id -u):$(id -g) sonarsource/sonar-scanner-cli:latest "$SONAR_AUTH_TOKEN" "$SONAR_HOST_URL"'
            }
          }
        }
      }
    }
  }
  post { 
    always { 
      cleanWs()
    }
  }
}
