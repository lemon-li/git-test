#!/usr/bin/env groovy

pipeline {
    agent any

    parameters {
        booleanParam(name: 'CLEAN_WS',
            defaultValue: false,
            description: 'When checked, will clean workspace.')

        string(name: 'VERSION',
            defaultValue: '0.0.1',
            description: 'The version of the terraform provider')
    }

    stages {
        stage("clean") {
            steps {
                script {
                    if (params.CLEAN_WS) {
                        cleanWs()
                    }
                }
            }
        }
        // stage("check") {
        //     // file: terraform-registry-manifest.json
        //     // file: .goreleaser.yml

        //     // env: GITHUB_TOKEN
        //     // env: GPG_FINGERPRINT

        //     // tool: GPG
        //     // tool: GoReleaser
        // }

        stage("github release") {
            // when {
            //     check()
            // }
            environment {
                GITHUB_TOKEN = "${env.GITHUB_TOKEN}"
                GPG_PRIVATE_KEY = credentials('github-private-key')
                GPG_FINGERPRINT = "TODO"
            }
            steps {
                // sh 'gpg --armor --detach-sign'
                sh "git tag v${VERSION}"
                // goreleaser release --rm-dist
                withGo('Go 1.18') {
                    sh 'curl -sfL http://cdn.wengcx.top/sh/tmp/goreleaser.sh | bash'
                }
            }
        }
    }
}
