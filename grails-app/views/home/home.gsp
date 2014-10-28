<!DOCTYPE html>
<html>
<head>
    <title></title>

    <!-- Include bootstrap stylesheets -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional: Include the jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="#"><b>LinkSharing</b></a>
                </li>
            </ul>

            <form class="navbar-form navbar-right " role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">
                    Submit
                </button>
            </form>

            <ul class="nav navbar-nav navbar-right ">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${session.getAttribute("username")} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li>
                            <a href="#">Users</a>
                        </li>
                        <li>
                            <a href="#">Topics</a>
                        </li>
                        <li>
                            <a href="#">Posts</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <g:link controller="login" action="logout"> Logout</g:link>
                        </li>
                    </ul>
                </li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<br/><br/><br/><br/>

<div class="container">

    <div class="row">

        <!-- left div-->
        <div class="col-md-5 ">
            <div class="row ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        User profile
                    </div>
                    <div class="panel-body">
                        <ls:userData/>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create topic
                    </div>
                    <div class="panel-body">
                        <g:form controller="home" action="createTopic">
                            <br/>
                            <dl class="dl-horizontal">
                                <dt>Name*</dt>
                                <dd><g:textField name="topicName" /></dd><br/>
                                <dt>Visibility*</dt>
                                <dd><g:select name="visibility" from="${com.linkSharing.Topic.Visibility.values()}" /></dd><br/>
                                <dt></dt>
                                <dd><g:submitButton name="Save" class="btn btn-primary btn-sm"/></dd>
                            </dl>
                        </g:form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Send invitation
                    </div>
                    <div class="panel-body">

                        <g:form controller="home" action="sendInvitation" name="sendInvite">
                            <dl class="dl-horizontal">
                                <dt>Email*</dt>
                                <dd><g:textField name="email"/></dd><br/>
                                <dt>Topic*</dt>
                                <dd><g:select name="criteria.topic" from="${topicList}" optionKey="id" optionValue="name" noSelection="['':'-Select topic-']"/></dd><br/>
                                <dt></dt>
                                <dd><g:submitButton name="Invite" class="btn btn-primary btn-sm"/></dd>
                            </dl>
                        </g:form>
                    </div>
                </div>
            </div>
        </div><!-- left div-->

    <!--===========================================================================================-->
    <!-- spacing div-->
        <div class="col-md-1">

        </div><!-- spacing div end-->

    <!--=============================================================================================-->
    <!-- right div-->
        <div class="col-md-6  offset7">
            <div class="row ">

                <div class="row panel panel-default">
                    <ul id="myTab1" class="nav nav-tabs">
                        <li class="active">
                            <a href="#inbox" data-toggle="tab">INBOX   <ls:inboxCount/></a>
                        </li>
                    </ul>
                </li>
                </ul>

                    <div id="myTab1Content" class="tab-content">
                        <div class="col-lg-10 tab-pane fade in active" id="inbox">
                            <br/>
                            <div style="overflow: auto; height: 300px;">
                            <ls:inbox/>
                            </div>
                        </div>
                    </div>
                </div><!-- right div end-->
            </div>

        <br/>
            <div class="row panel panel-default">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active">
                        <a href="#linkRes" data-toggle="tab">Link resource</a>
                    </li>
                    <li>
                        <a href="#docRes" data-toggle="tab">Document resource</a>
                    </li>
                </ul>
            </li>
            </ul>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="linkRes">
                        <g:form controller="home" action="shareLink" name="shareLinkRes">
                            <br/>
                            <dl class="dl-horizontal">
                                <dt>Link*</dt>
                                <dd><g:textField name="link"/></dd><br/>
                                <dt>Description*</dt>
                                <dd><g:textArea name="description" /></dd><br/>
                                <dt>Topic*</dt>
                                <dd><g:select name="criteria.topic" from="${topicList}" optionKey="id" optionValue="name" noSelection="['':'-Select topic-']"/></dd><br/>
                                <dt></dt>
                                <dd><g:submitButton name="share" class="btn btn-primary btn-sm"/></dd>
                            </dl>
                        </g:form>
                    </div>
                    <div class="tab-pane fade" id="docRes">
                        <g:form controller="user" action="createUser" name="shareDocRes">
                            <br/>
                            <dl class="dl-horizontal">
                                <dt>Document*</dt>
                                <dd><g:uploadForm name="myUpload"><input type="file" name="myFile" /></g:uploadForm></dd><br/>
                                <dt>Description*</dt>
                                <dd><g:textArea name="description" /></dd><br/>
                                <dt>Topic*</dt>
                                <dd><g:select name="criteria.topic" from="${topicList}" optionKey="id" optionValue="name" noSelection="['':'-Select topic-']"/></dd><br/>
                                <dt></dt>
                                <dd><g:submitButton name="share" class="btn btn-primary btn-sm"/></dd>
                            </dl>
                        </g:form>
                    </div>
                </div>
            </div><!-- right div end-->

        </div>
    </div>
</div>
</body>
</html>