package com.linkSharing

class Subscription {

    Topic topic
    User user
    Date dateCreated


    enum Seriousness {
        Serious,
        Very_Serious,
        Casual
    }

    Seriousness seriousness

    static belongsTo = [user:User,topic:Topic]



    static constraints = {
    }
}
