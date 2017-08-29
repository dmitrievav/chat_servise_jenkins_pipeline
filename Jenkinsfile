#!groovy

stage('build') {
    node('swarm') {
        // https://support.cloudbees.com/hc/en-us/articles/226122247-How-to-Customize-Checkout-for-Pipeline-Multibranch
        checkout scm
        sh 'hostname; pwd; ls -laFh; env'
        sh 'git branch; git status; git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short --all | head'
        sh 'chat_service/build.sh'
        archiveArtifacts 'chat_service/target/surefire-reports/*'
        archiveArtifacts 'chat_service/target/*.jar'
        junit 'chat_service/target/surefire-reports/*.xml'
        stash includes: 'chat_service/target/*.jar', name: 'chat_service_app'
    }
}

stage('test') {
    node('swarm') {
        parallel debian: {
                withDockerContainer('debian') {
                    sh 'cat /etc/*rele*'
                    //unstash 'chat_service_app'
                    sh 'hostname; pwd; ls -laFh'
                }
            },
            centos: {
                withDockerContainer('centos') {
                    sh 'cat /etc/*rele*'
                    //unstash 'chat_service_app'
                    sh 'hostname; pwd; ls -laFh'
                }
            }
    }
}

stage('staging deployment') {
    timeout(time: 60, unit: 'SECONDS') {
        input(message: 'Would you like to deploy to staging?')
    }
    node('swarm') {
        sh 'echo deploy to staging completed'
    }
}

stage('staging QA') {
    node('swarm') {
        sh 'echo QA staging completed'
    }
}

stage('LIVE deployment') {
    timeout(time: 60, unit: 'SECONDS') {
        input(message: 'Would you like to deploy to LIVE?')
    }
    node('swarm') {
        sh 'echo deploy to live completed'
    }
}

stage('LIVE QA') {
    node('swarm') {
        sh 'echo QA LIVE completed'
    }
}


