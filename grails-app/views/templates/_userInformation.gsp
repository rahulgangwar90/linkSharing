<div>
    <br>
    <div class="avatar" style="float: left; margin-top: 20px;">
        <g:if test="${user.avatar}">
            <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:user.ident())}" />
        </g:if>
        <g:else>
        <img src="http://dummyimage.com/150x150/000/fff.jpg" alt="Avatar" class="avatar" />
        </g:else>
    </div>
    <div class="comment-content" style="float: right; margin-right: 64px;">
     <p style="font: 10px"><b>${name}</b></p>
     <p>@${username}</p>
     <p>Subscription : ${totalSubscription}  Topics : ${totalTopic}</p>
    </div>
    <div class="clear-both"></div>
</div>