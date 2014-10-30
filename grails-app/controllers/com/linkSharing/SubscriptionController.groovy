package com.linkSharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class SubscriptionController {

    def utilService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def subscribe(){

        utilService.subscribe(params,session)
        forward(controller: "home"  , action: "dashboard")

    }
    def unSubscribe(){

        utilService.unSubscribe(params,session)
        forward(controller: "home"  , action: "dashboard")

    }
}
