package com.linkSharing

import javax.rmi.CORBA.Util

class HomeController {


    def mailService
    UtilService utilService
    def logService


    def index() {

        if(session.user){
            dashboard()

        }
        else{
            render view : "/login/login"
        }
    }

    def shareLink(){

        utilService.shareLink(params,session)

        dashboard()

    }

   def dashboard(){

       User user = User.findByUsername(session.getAttribute("username"))
       List topics = Topic.createCriteria().list {

           'subscriptions' {
               eq("user", user)

           }
       };


       render view: "home" ,model:['topicList':topics]
   }

    def createTopic(){

        utilService.createTopic(params,session)
        dashboard()

    }


    def sendInvitation(){


        def toEmail = params.email
        def topicId = params.criteria.topic

        def fromEmail = User.findByUsername(session.getAttribute("username")).email

        logService.log( "fromEmail : ${fromEmail}  toEmail : ${toEmail}   topic : ${topicId}")


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
