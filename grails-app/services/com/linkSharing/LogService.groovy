package com.linkSharing

import grails.transaction.Transactional


class LogService {

    def serviceMethod() {

    }

    def log(message){

        log.info message
    }
}
