package com.linkSharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class TopicController {

    def utilService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def modify(){

        utilService.modifyTopic(params,session)
        forward(controller: "home" , action: "dashboard")

    }
}
