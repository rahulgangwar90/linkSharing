package com.linkSharing

class Resource {

    Topic topic
    User createdBy
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic : Topic]

    static hasMany = [resourceRatings:ResourceRating,readingItems:ReadingItem]

    static constraints = {
        description size: 0..1024

    }
}
