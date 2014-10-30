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

        //def readingList = ReadingItem.findAllByUserAndIsRead(user,false)

        def readingList = ReadingItem.createCriteria().list {

            eq("user",user)

        }



        readingList.reverseEach {

            out << g.render(template: "/templates/inbox", model: [name:name,username: username,description:it.resource.description,user:user,currentResource:it.resource])

        }

    }



    def inboxCount = {

         User user = User.findByUsername( session.getAttribute("username"))
        def name = "\u0024{user.firstname} \u0024{user.lastname} "
        def username = user.username

        def readingListCount = ReadingItem.countByUserAndIsRead(user,false)



        out << g.render(template: "/templates/badge", model: [count:readingListCount])

    }

    def trendingTopics = {


        def list = Resource.list(sort: "dateCreated",order: "desc", offset: 0 , max: 5)   // todo apply find trending topic logic

//        def listOfOwnedTopics = Topic.findByUser(User.findByUsername(session.getAttribute("username")))
        User user = User.findByUsername(session.getAttribute("username"))

        list.each {

            def totalPost = Resource.countByTopic(it.topic)
            def totalSubscriptions = Subscription.countByTopic(it.topic)

            def topicOwner = Topic.findByName(it.topic.name)
            boolean isOwned
            boolean isSubscribed


            if(Topic.findByNameAndUser(it.topic.name,user)){

                 isOwned = true

            }
            else{
                 isOwned = false
                if(Subscription.findByUserAndTopic(user,it.topic)){
                    isSubscribed = true
                }
                else{
                    isSubscribed = false
                }


            }

            out << g.render(template: "/templates/trendingTopics", model: [isSubscribed:isSubscribed,isOwned:isOwned,totalPost:totalPost,totalSubscriptions:totalSubscriptions,topicOwner:topicOwner])



        }

    }


}


