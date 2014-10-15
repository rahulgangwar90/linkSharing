package com.linkSharing

class ResourceRating {

    Resource resource
    User user
    Integer score

    static belongsTo = [user:User,resource:Resource]



    static constraints = {
    }
}
