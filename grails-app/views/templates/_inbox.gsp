<%@ page import="com.linkSharing.LinkResource" %>
<div class="media">
    <a class="pull-left" href="#">
        <img src="http://dummyimage.com/70x70/000/fff.jpg" alt="Avatar" class="avatar" />
    </a>
    <div class="media-body">
        <h4 class="media-heading">${name} <small>@${username}  </small></h4>
        <p>${description}</p>



        <div>

           <g:if  test="${currentResource.instanceOf(LinkResource)}">
                <a href="${currentResource.url}" target="_blank"><p class="pull-left">View full site</p></a>
            </g:if>
            <g:else>
                <a href="${currentResource.filePath}" target="_blank"><p class="pull-left">Download</p></a>
            </g:else>
            <g:link controller="readingItem" action="markAsRead" params="[currentResourceId:currentResource.id]"> <p class="pull-right">mark as read</p></g:link>
      </div>

    </div>
</div>
<hr>