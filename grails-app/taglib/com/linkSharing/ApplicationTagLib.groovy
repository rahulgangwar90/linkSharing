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

            out << it.user.username +"..................."+ it.topic.name+"<br>"
            out << "______________________________________________<br>"
            out << it.description + "<br>"
            out << "______________________________________________<br>"
        }

    }


    def topPosts = {

        List resourcesRating = ResourceRating.list(sort: "score",order: "desc" , max: 5)

        resourcesRating.each{

            out << it.user.username +"..................."+ it.resource.topic.name+"<br>"
            out << "______________________________________________<br>"
            out << it.resource.description + "<br>"
            out << "______________________________________________<br>"
        }

    }

    def userData = {

        User user = User.findByUsername( session.getAttribute("username"))
        def name = "${user.firstname} ${user.lastname} "
        def username = user.username

        def totalTopic = Topic.countByUser(user)
        def totalSubscription = Subscription.countByUser(user)

        out << "<p>${name}</p>"
        out << "<p>@${username}</p>"
        out << "<p>Subscription : ${totalSubscription}   Topics : ${totalTopic}</p>"

    }

    def inbox = {

        User user = User.findByUsername( session.getAttribute("username"))
        def name = "${user.firstname} ${user.lastname} "
        def username = user.username

        def readingList = ReadingItem.findAllByUser(user)


        out << "<table border=\"1\">"

        readingList.each {
            out << "<tr >"
            out << "<td>"
            out << "<p>${name}  @${username}  &nbsp;&nbsp; </p>"
            out << "<p>${it.resource.description}</p>"
            out << "</td>"
            out << "</tr>"

        }
        out << "</table>"




    }
}


