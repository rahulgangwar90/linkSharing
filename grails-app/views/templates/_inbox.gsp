<div class="media">
    <a class="pull-left" href="#">
        <img src="http://dummyimage.com/70x70/000/fff.jpg" alt="Avatar" class="avatar" />
    </a>
    <div class="media-body">
        <h4 class="media-heading">${name} <small>@${username}  </small></h4>
        <p>${description}</p>

        <div>
            <g:link controller="user" action="markAsRead" > <p class="pull-right">mark as read</p></g:link>
        </div>

    </div>
</div>
<hr>