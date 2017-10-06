#!groovy

node("master") {
    timestamps {
        stage("checkout") {
            checkout scm
        }
        stage("test") {
            sh("docker build -t sample-spring-boot-with-gradle-dev -f Dockerfile-dev .")
            sh("find . -type f | sort")
            sh('docker run --rm -v $(pwd):/var/sample-spring-boot-with-gradle sample-spring-boot-with-gradle-dev find . -type f')
            sh('docker run --rm -v $(pwd):/var/sample-spring-boot-with-gradle sample-spring-boot-with-gradle-dev ./gradlew test')
        }
    }
}
