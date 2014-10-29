package com.linkSharing

import grails.transaction.Transactional

@Transactional
class UtilService {



    def serviceMethod() {

    }


    def createUser(){

    }

    def createTopic(params,session){


        def topicName = params.topicName
        def visibility = params.visibility


        User user = User.findByUsername(session.getAttribute("username"))
        Topic topic = new Topic(user: user, name: topicName, visibility: visibility)

        Subscription subs = new Subscription(seriousness : "Serious",topic: topic ,user: user)


        if (!topic.save(flush: true)) {
            topic.errors.each {
                println it
            }
        }
        else {
            subs.save(flush: true)
            println "Topic added successfully !!"
        }

    }


    def shareLink(params,session){

        println " inside shareLink"
        def link = params.link
        def description = params.description
        def topicId = params.criteria.topic

        Topic topic = Topic.get(topicId)
        User user = User.findByUsername(session.getAttribute("username"))
        Resource resource = new LinkResource(topic:topic,user: user,description:description,url: link)

        def userListSubscriberToTopic = Subscription.findByTopic(topic)

        def readingList =[]

        userListSubscriberToTopic.each {

            ReadingItem readingItem = new ReadingItem(user:userListSubscriberToTopic.user ,resource: resource , isRead: false)
            readingList.add(readingItem)

        }

        ReadingItem readingItem = new ReadingItem(user:user ,resource: resource , isRead: false)

        if (!resource.save(flush: true)) {
            resource.errors.each {
                println it
            }
        }
        else {
            println "Link resource added successfully !!"

            readingList.each {
                it.save(flush: true)
            }
        }

    }
}
