package com.linkSharing

class Topic implements Serializable {

    String name
    User user
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

    static mapping = {
       // id composite: ['user', 'name']
    }
}
