<div class="media">
    <g:link class="pull-left" controller="user" action="showUserDetails">

        <g:if test="${user.avatar}">
            <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:user.ident())}" />
        </g:if>
        <g:else>
            <img src="http://dummyimage.com/150x150/000/fff.jpg" alt="Avatar" class="avatar" />
        </g:else>    </g:link>
    <div class="media-body">
        <br/>
        <h4 class="media-heading">${name} </h4>
        <br/>
        <g:link class="pull-left" controller="user" action="showUserDetails"><p><small>@${username}  </small></p></g:link>
        <br/><br/>
        <p>Subscription : ${totalSubscription}  Topics : ${totalTopic}</p>

    </div>
</div>
