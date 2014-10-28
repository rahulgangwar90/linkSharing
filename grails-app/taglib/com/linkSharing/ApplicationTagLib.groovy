package com.linkSharing

class ApplicationTagLib {
    static defaultEncodeAs = [taglib:'raw']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "ls"

    def myTag = { attrs, body ->
        List<Topic> list = attrs.topics
        println "All my attributes are here"
        println attrs

        out <<  "Now my tag is outputting something"
        out << anotherTag()
        out << g.render(template: '/home/sampleForTag')
    }

    def anotherTag = { attrs ->
        out << "This is another tag"
    }

    def outputMyLinkFormat = {attrs ->
        String link = g.createLink(attrs)
        out << link + "/hello"
    }

    def recentShares = {

        List resources = Resource.list(sort: "dateCreated",order: "desc" , max: 5)

        resources.each{

            def username = it.user.username
            def topicName = it.topic.name
            def description = it.description
            def fullName = it.user.firstname + " " + it.user.lastname


            out << g.render(template: "/templates/recentShared" ,model: [fullName :fullName,username:username , topicName : topicName , description: description])


        }

    }


    def topPosts = {

        List resourcesRating = ResourceRating.list(sort: "score",order: "desc" , max: 5)

        resourcesRating.each{

            def username = it.user.username
            def topicName = it.resource.topic.name
            def description = it.resource.description
            def fullName = it.user.firstname + " " + it.user.lastname


            out << g.render(template: "/templates/recentShared" ,model: [fullName :fullName,username:username , topicName : topicName , description: description])

        }

    }

    def userData = {

        User user = User.findByUsername( session.getAttribute("username"))
        def name = "${user.firstname} ${user.lastname} "
        def username = user.username

        def totalTopic = Topic.countByUser(user)
        def totalSubscription = Subscription.countByUser(user)



        out << g.render(template: "/templates/userInformation" , model: [name:name,username:username,totalSubscription:totalSubscription,totalTopic:totalTopic,user:user])

    }

    def inbox = {

        User user = User.findByUsername( session.getAttribute("username"))
        def name = "${user.firstname} ${user.lastname} "
        def username = user.username

        def readingList = ReadingItem.findAllByUser(user)



        readingList.reverseEach {

            out << g.render(template: "/templates/inbox", model: [name:name,username: username,description:it.resource.description])

        }

    }



    def inboxCount = {

         User user = User.findByUsername( session.getAttribute("username"))
        def name = "\u0024{user.firstname} \u0024{user.lastname} "
        def username = user.username

        def readingListCount = ReadingItem.countByUser(user)

        out << g.render(template: "/templates/badge", model: [count:readingListCount])

    }
}


