/**
 * This pipeline will build and deploy a Docker image with Kaniko
 * https://github.com/GoogleContainerTools/kaniko
 * without needing a Docker host
 *
 * You need to create a jenkins-docker-cfg secret with your docker config
 * as described in
 * https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/#create-a-secret-in-the-cluster-that-holds-your-authorization-token
 *
 * ie.
 * kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=csanchez --docker-password=mypassword --docker-email=john@doe.com
 */

pipeline {
  agent {
    kubernetes {
      defaultContainer 'kaniko'
      yamlFile "ci/kaniko.yaml"
    }
  }

  environment {
    SHORT_COMMIT = "${GIT_COMMIT[0..7]}"
  }

  stages {
    stage('Build with Kaniko') {
      steps {
	SHORT_COMMIT=${GIT_COMMIT[0..7]}
	echo "${SHORT_COMMIT}"
	sh '/kaniko/executor -f `pwd`/Dockerfile -c `pwd` --skip-tls-verify --destination gitlab.bxsoft.com:4567/mmartin/phello:tmp'
      }
    }
  }
}
