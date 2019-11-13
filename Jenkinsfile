pipeline {
  agent none
  stages {
    stage('Package') {
      agent kubernetes {
        yamlFile "ci/kaniko.yaml"
      }
      steps {
        container(name: 'kaniko', shell: '/busybox/sh') {
          sh '''
          /kaniko/executor --context `pwd` --destination https://gitlab.bxsoft.com:4567/mmartin/phello:tmp -f `pwd`/Dockerfile 
          '''
	}
      }
    }
  } 
}
