def dockerImage;

node('docker'){
	stage('SCM'){
		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/S0meth1ng85/JenkinsDocker']]]);
	}
	stage('build'){
		dockerImage = docker.build('redlineby/jenkinsdocker:v$BUILD_NUMBER', './dotnetcore');
	}
	stage('push'){
		docker.withRegistry('https://index.docker.io/v1/', 'redlineby'){
			dockerImage.push();
		}
	}
}
