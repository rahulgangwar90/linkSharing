package com.linkSharing

import grails.transaction.Transactional

@Transactional
class BootstrapService {

    def serviceMethod() {

    }

    def createUsers() {
        log.info "========================= adding user =========================="

        User user = new User(firstname: "rahul", lastname: "gangwar", email: "rahulgangwar90@gmail.com", password: "1234", username: "rahul")
        User user1 = new User(firstname: "rohit", lastname: "singh", email: "rohit@gmail.com", password: "1234", username: "rohit")
        user.save()
        user1.save()

    }

    def createTopicsAndAutoSubscribe() {

        log.info "======creating topics and autoSubscribing========"


        User user1 = User.get(1)
        User user2 = User.get(2)
        Topic topic1 = new Topic(user: user1, name: "Topic no 1", visibility: "Public")
        Topic topic2 = new Topic(user: user1, name: "Topic no 2", visibility: "Public")
        Topic topic3 = new Topic(user: user1, name: "Topic no 3", visibility: "Public")

        List list = [topic1,topic2,topic3]

        list.each{
            it.save(flush: true)
            Subscription subs = new Subscription(seriousness : "Serious",topic: it ,user: it.user)
            subs.save(flush: true)
        }


    }


    def addingResourceToTopic(){

        log.info "===== adding resource to topic ========="


        User user = User.get(1)
        Topic topic = Topic.get(1)
        Topic topic2 = Topic.get(2)

        Resource resource1 = new LinkResource(url: "http://www.google.com",user:user,topic:topic,description: "linkResource-1 for topic no 1")
        Resource resource2 = new LinkResource(url: "http://www.google.com",user:user,topic:topic,description: "linkResource1-2 for topic no 1")
        Resource resource3 = new LinkResource(url: "http://www.google.com",user:user,topic:topic,description: "linkResource1-3 for topic no 1")
        Resource resource4 = new LinkResource(url: "http://www.google.com",user:user,topic:topic,description: "linkResource1-4 for topic no 1")
        Resource resource5 = new LinkResource(url: "http://www.google.com",user:user,topic:topic,description: "linkResource1-5 for topic no 1")

        Resource resource6 = new LinkResource(url: "http://www.google.com",user:user,topic:topic2,description: "linkResource-1 for topic no 2")
        Resource resource7 = new LinkResource(url: "http://www.google.com",user:user,topic:topic2,description: "linkResource1-2 for topic no 2")
        Resource resource8 = new LinkResource(url: "http://www.google.com",user:user,topic:topic2,description: "linkResource1-3 for topic no 2")
        Resource resource9 = new LinkResource(url: "http://www.google.com",user:user,topic:topic2,description: "linkResource1-4 for topic no 2")
        Resource resource10 = new LinkResource(url: "http://www.google.com",user:user,topic:topic2,description: "linkResource1-5 for topic no 2")

        List list = [resource6,resource1,resource10,resource2,resource3,resource4,resource5,resource7,resource8,resource9]

        list.each{

            sleep(1000)
            it.save(flush: true,failOnError: true)
        }

    }

    def addingRating(){


        log.info  "===============adding rating ======================"
        User user = User.get(1)


        ResourceRating resourceRating1 = new ResourceRating(user: user , resource:Resource.get(1) , score: 5)
        ResourceRating resourceRating2 = new ResourceRating(user: user , resource:Resource.get(2)  , score: 4)
        ResourceRating resourceRating3 = new ResourceRating(user: user , resource:Resource.get(3) , score: 5)
        ResourceRating resourceRating4 = new ResourceRating(user: user , resource:Resource.get(4) , score: 3)

        List list = [resourceRating1,resourceRating2,resourceRating3,resourceRating4]

        list.each{
            it.save(flush: true,failOnError: true)
        }

    }

    def addingReadingItem(){

        log.info "adding reading item"

        User user = User.get(1)

        Resource resource = Resource.get(1)
        Resource resource2 = Resource.get(2)
        Resource resource3 = Resource.get(3)
        Resource resource4 = Resource.get(4)

        ReadingItem readingItem = new ReadingItem(user:user ,resource: resource , isRead: false)
        ReadingItem readingItem2 = new ReadingItem(user:user ,resource: resource2 , isRead: false)
        ReadingItem readingItem3 = new ReadingItem(user:user ,resource: resource3 , isRead: false)
        ReadingItem readingItem4 = new ReadingItem(user:user ,resource: resource4 , isRead: false)

        List list = [readingItem,readingItem2,readingItem3,readingItem4]

        list.each{
            it.save(flush: true,failOnError: true)
        }
    }

}
