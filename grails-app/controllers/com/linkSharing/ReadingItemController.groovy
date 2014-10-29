package com.linkSharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class ReadingItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def markAsRead(){

        println "marking resource as read"


        Resource resource = Resource.get(params.currentResourceId)

        User user = User.findByUsername(session.getAttribute("username"))
        ReadingItem readingItem = ReadingItem.findByUserAndResource(user,resource)

        readingItem.isRead = true

        readingItem.save(flush: true)

        redirect controller: "home" , action: "dashboard"



    }
}
