def dockerImage;

node('docker-ex'){
	stage('SCM'){
		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/S0meth1ng85/JenkinsDocker']]]);
	}
	stage('build'){
		docker.withRegistry('https://index.docker.io/v1/', 'redlineby'){
		sh 'docker buildx create --name cbbspace'
		sh 'docker buildx use cbbspace'
		sh 'docker buildx build -t redlineby/simplednc:jenkinsfile
		--platform=linux/amd64,linux/arm/v7 - < dncgit.Dockerfile --push'
		}
	}
}
