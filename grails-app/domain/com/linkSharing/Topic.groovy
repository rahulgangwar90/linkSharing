package com.linkSharing

class Topic {

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated

    enum Visibility{
        Public,Private
    }

    Visibility visibility

    static belongsTo = [user : User]

    static hasMany = [resources: Resource,subscriptions:Subscription]

    static constraints = {
    }
}
