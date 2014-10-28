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
        <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="#"><b>LinkSharing</b></a>
                </li>
            </ul>

            <form class="navbar-form navbar-right " role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>
                    Submit
                </button>
            </form>

            %{--<ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">Link</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="#">Action</a>
                        </li>
                        <li>
                            <a href="#">Another action</a>
                        </li>
                        <li>
                            <a href="#">Something else here</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">Separated link</a>
                        </li>
                    </ul>
                </li>
            </ul>--}%

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<br/><br/><br/><br/>

<div class="container">

    <div class="row">

        <!-- left div-->
        <div class="col-md-7 ">
            <div class="row ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Recent Shares
                    </div>
                    <div class="panel-body">
                        <ls:recentShares/>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Top posts
                    </div>
                    <div class="panel-body">
                        <ls:topPosts/>
                    </div>
                </div>
            </div>
        </div><!-- left div-->

    <!-- spacing div-->
        <div class="col-md-1">

        </div><!-- spacing div end-->

    <!-- right div-->
        <div class="col-md-4  offset7">
            <div class="row panel panel-default">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active">
                        <a href="#login" data-toggle="tab"><b>Login</b></a>
                    </li>
                    <li>
                        <a href="#signup" data-toggle="tab"><b>Sign Up</b></a>
                    </li>
                </ul>
            </li>
            </ul>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="login">
                        <br>
                        <g:form name="loginForm" controller="login" action="validateCredential" >

                            <dl class="dl-horizontal">
                                <dt>Username</dt>
                                <dd><g:textField name="username"/></dd><br>
                                <dt>Password</dt>
                                <dd><g:textField name="password"/></dd><br>
                                <dt></dt>
                                <dd><g:submitButton name="submit" value="Login" class="btn btn-primary btn-sm"/></dd>
                            </dl>
                        </g:form>
                    </div>
                    <div class="tab-pane fade" id="signup">
                        <g:uploadForm name="register" controller="user" action="createUser">

                            <br><br>
                            <dl class="dl-horizontal">
                                <dt>first name</dt>
                                <dd><g:textField name="firstName"/></dd><br>
                                <dt>last name</dt>
                                <dd><g:textField name="lastName"/></dd><br>
                                <dt>email</dt>
                                <dd><g:textField name="email"/></dd><br>
                                <dt>username</dt>
                                <dd><g:textField name="username"/></dd><br>
                                <dt>password</dt>
                                <dd><g:textField name="password"/></dd><br>
                                <dt>confirm password</dt>
                                <dd><g:textField name="confirmPassword"/></dd><br>
                                <dt>Avatar (16K)</dt>
                                <dd><input type="file" name="avatar" id="avatar" /></dd><br/>
                                <dt></dt>
                                <dd><g:submitButton name="register" value="Register" class="btn btn-primary btn-sm"/></dd>
                            </dl>

                        </g:uploadForm>
                    </div>
                </div>
            </div><!-- right div end-->

        </div>
    </div>
</div>
</body>
</html>