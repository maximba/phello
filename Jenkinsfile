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


// http://jenkins.gitlab.bxsoft.com/git/notifyCommit?url=ssh://git@gitlab.bxsoft.com/mmartin/phello.git' --user 'jenkins-trigger:mysecrettoken123'

pipeline {
  agent {
    kubernetes {
      defaultContainer 'kaniko'
      yamlFile "ci/kaniko.yaml"
    }
  }

  environment {
/*    TAG = "${GIT_COMMIT[0..7]}" */
    TAG = "${GIT_BRANCH}"
  }

  triggers {
    GenericTrigger ( 
      genericVariables:[[key: 'ref', value: '$.ref']],
      causeString: 'Trigger on $ref',
      regexpFilterExpression:  '',
      printContributedVariables: true
      printPostContent: true
    }
  }

  stages {
    stage('Build with Kaniko') {
      steps {
 	sh "echo $ref"
	sh '/kaniko/executor -f `pwd`/Dockerfile -c `pwd` --skip-tls-verify --destination gitlab.bxsoft.com:4567/mmartin/phello:"${TAG}"'
      }
    }
  }
}
