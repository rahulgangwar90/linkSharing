package com.linkSharing

class ReadingItem {

    User user
    Resource resource
    boolean isRead

    static belongsTo = [user : User,resource:Resource]



    static constraints = {
    }
}
