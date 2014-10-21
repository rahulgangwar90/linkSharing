package com.linkSharing

class User {

    String email
    String username
    String firstname
    String lastname
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    String password

    static hasMany = [topics: Topic,readingItems:ReadingItem,resourceRatings:ResourceRating,subscription:Subscription]

    static constraints = {
        email email: true, blank: false , unique: true
        username unique: true
    }
    static mapping = {
        autoTimestamp true
    }
}
