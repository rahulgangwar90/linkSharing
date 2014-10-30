import com.linkSharing.LinkResource
import com.linkSharing.ReadingItem
import com.linkSharing.Resource
import com.linkSharing.ResourceRating
import com.linkSharing.Subscription
import com.linkSharing.Topic
import com.linkSharing.User

class BootStrap {

    def bootstrapService

    def init = { servletContext ->
        bootstrapService.createUsers()
        bootstrapService.createTopicsAndAutoSubscribe()
        bootstrapService.addingResourceToTopic()
        bootstrapService.addingRating()
        bootstrapService.addingReadingItem()
    }

    def destroy = {
    }


}
