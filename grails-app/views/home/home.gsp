<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Home</title>

    <!-- Include bootstrap stylesheets -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
     <asset:stylesheet href="myStyle.css"/>

    <![endif]-->
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand" href="#">Link Sharing</a>
        </div>

        <div class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" role="form">
                <div class="form-group">
                    <input type="text" placeholder="Search" class="form-control">
                </div>

                <button type="submit" class="btn btn-success">Search</button>
            </form>



        </div><!--/.navbar-collapse -->




    </div>
</div>

<br><br>

<div class="container">
    <div class="row">
        <div class="col-md-9" >
            <div id="box">
            <h2>user information</h2>


            <ls:userData/>
            <g:form controller="login" action="logout" >
                <g:submitButton name="logout" value="logout"/>
            </g:form>
           </div>
        </div>

        <div class="col-md-3">
           <h2>INBOX</h2>
            <ls:inbox />
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <h2>Subscription</h2>
        </div>
        <div class="col-md-3">
            <h2>share link</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <h2>trending topics</h2>
        </div>
        <div class="col-md-3">
            <h2>share document</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <h2>send invitation </h2>
        </div>
        <div class="col-md-3">
            <h2>create topic</h2>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../../dist/js/bootstrap.min.js"></script>
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
