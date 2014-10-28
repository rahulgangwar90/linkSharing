package com.linkSharing

class HomeController {


    def mailService

    def index() {

        if(session.user){
            dashboard()

        }
        else{
            render view : "/login/login"
        }



    }

    def shareLink(){

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

        dashboard()

    }

   def dashboard(){

       if(session.user){
           dashboard()

       }
       else{
           render view : "/login/login"
       }

       User user = User.findByUsername(session.getAttribute("username"))
       List topics = Topic.findAllByUser(user)

       render view: "home" ,model:['topicList':topics]
   }

    def createTopic(){

        def topicName = params.topicName
        def visibility = params.visibility


        User user = User.findByUsername(session.getAttribute("username"))
        Topic topic = new Topic(user: user, name: topicName, visibility: visibility)


        if (!topic.save(flush: true)) {
            topic.errors.each {
                println it
            }
        }
        else
            println "Topic added successfully !!"

        dashboard()

    }


    def sendInvitation(){


        def toEmail = params.email
        def topicId = params.criteria.topic

        def fromEmail = User.findByUsername(session.getAttribute("username")).email

        println "fromEmail : ${fromEmail}  toEmail : ${toEmail}   topic : ${topicId}"
        println "sending mail"

        mailService.sendMail {
            to "${toEmail}"
            from "${fromEmail}"
            subject "Invitation request"
            body 'click on the link to subscribe to the topic :  http://localhost:8080/LinkSharing/confirmInvite?email=${toEmail}+topicId=${topicId}'
        }

        println "mail sent"
        render "done"
    }
}
