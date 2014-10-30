<g:if test="${isOwned}">
    <div class="media">
        <g:link class="pull-left" controller="user" action="showUserDetails">

            <g:if test="${topicOwner.user.avatar}">
                <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:topicOwner.user.ident())}" />
            </g:if>
            <g:else>
                <img src="http://dummyimage.com/50x50/000/fff.jpg" alt="Avatar" class="avatar" />
            </g:else>    </g:link>
        <div class="media-body">

            <g:form controller="topic" action="modify">
                <g:textField name="topicNewName" value="${topicOwner.name}"/>
                <g:hiddenField name="topicId" value="${topicOwner.id}"/>

                <g:submitButton name="submit" value="save"/>
            </g:form>

            <div>
                <g:link class="pull-left" controller="user" action="showUserDetails"><p><small>@${topicOwner.user.username}  </small></p></g:link>
                <br/>

            </div>
            <p class="pull-right">Subscription : ${totalSubscriptions} &nbsp; Posts : ${totalPost}</p>
            <div>
                <g:select name="visibility" from="${com.linkSharing.Topic.Visibility.values()}" />
                <g:select name="seriousness" from="${com.linkSharing.Subscription.Seriousness.values()}" />
                <g:link class="pull-right" controller="user" action="showUserDetails"><span class="glyphicon  glyphicon-envelope"></span></g:link>
                <g:link class="pull-right" controller="user" action="showUserDetails"><span class="glyphicon  glyphicon-edit"></span></g:link>
                <g:link class="pull-right" controller="user" action="showUserDetails"><span class="glyphicon  glyphicon-trash"></span></g:link>

            </div>

        </div>
    </div>
</g:if>
<g:else>
    <div class="media">
        <g:link class="pull-left" controller="user" action="showUserDetails">

            <g:if test="${topicOwner.user.avatar}">
                <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:topicOwner.user.ident())}" />
            </g:if>
            <g:else>
                <img src="http://dummyimage.com/50x50/000/fff.jpg" alt="Avatar" class="avatar" />
            </g:else>    </g:link>
        <div class="media-body">

            <h4 class="media-heading">${topicOwner.name} </h4>
            <div>
                <g:link class="pull-left" controller="user" action="showUserDetails"><p><small>@${topicOwner.user.username}  </small></p></g:link>
                <br/>
                <g:if test="${isSubscribed}">
                    <g:link class="pull-left" controller="subscription" action="unSubscribe" params="[topicId : topicOwner.id]">
                    <p><small>UnSubscribe  </small></p></g:link>
                    <g:select name="seriousness" from="${com.linkSharing.Subscription.Seriousness.values()}" />

                    <g:link class="pull-right" controller="user" action="showUserDetails"><span class="glyphicon  glyphicon-envelope"></span></g:link>
                    &nbsp;
                    <g:link class="pull-right" controller="user" action="showUserDetails"><span class="glyphicon  glyphicon-edit"></span></g:link>
                    &nbsp;
                    <g:link class="pull-right" controller="user" action="showUserDetails"><span class="glyphicon  glyphicon-trash"></span></g:link>

                </g:if>
                <g:else>
                    <g:link class="pull-left" controller="subscription" action="subscribe" params="[topicId : topicOwner.id]" >
                    <p><small>Subscribe  </small></p></g:link>
                </g:else>
             </div>
            <p class="pull-right">Subscription : ${totalSubscriptions} &nbsp; Posts : ${totalPost}</p>
            
        </div>
    </div>

</g:else>




