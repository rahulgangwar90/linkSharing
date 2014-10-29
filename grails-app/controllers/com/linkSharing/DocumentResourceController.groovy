package com.linkSharing

class DocumentResourceController {

    def index() {}


    def createDocRes(){


        println "adding document resource"

        def file = request.getFile('file')
        def filepath
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
             filepath = grailsApplication.config.uploadFolder + file.originalFilename
            file.transferTo(new File(filepath))
        }

        def description = params.description
        def topicId = params.criteria.topic

        Topic topic = Topic.get(topicId)
        User user = User.findByUsername(session.getAttribute("username"))
        Resource resource = new DocumentResource(topic:topic,user: user,description:description,filePath:filepath )

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
            println "Document resource added successfully !!"

            readingList.each {
                it.save(flush: true)
            }
        }

        forward(controller: "home" , action: "dashboard")

    }




}
