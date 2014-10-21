package com.linkSharing

 class Resource {

    Topic topic
    User user
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic : Topic]

    static hasMany = [resourceRatings:ResourceRating,readingItems:ReadingItem]

    static mapping = {
        tablePerHierarchy true
//        sort dateCreated:"desc"
    }

    static constraints = {
        description size: 0..1024

    }
}
