<div class="media">
    <a class="pull-left" href="#">
        <img src="http://dummyimage.com/50x50/000/fff.jpg" alt="Avatar" class="avatar" />
    </a>
    <div class="media-body">
        <div class="pull-left">
            <h4 class="media-heading">${fullName} <small>@${username}  </small></h4>
        </div>
        <div class="pull-right">
            <g:link controller="user" action="markAsRead" > <p class="pull-right">${topicName}</p></g:link>
        </div>
        <div class="clearfix"></div>

        <div class="pull-left">
            <p>${description}</p>
        </div>
        <div class="pull-right">

            <g:link controller="user" action="markAsRead" > <p class="pull-right">View post</p></g:link>
        </div>
        <div class="clearfix"></div>

    </div>

</div>
<hr>