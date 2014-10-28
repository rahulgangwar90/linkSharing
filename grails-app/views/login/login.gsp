<!DOCTYPE html>
<!--[if IE 8 ]><html lang="en" class="ie8"><![endif]-->
<!--[if IE 9 ]><html lang="en" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- stylesheet for demo and examples -->
    <asset:stylesheet href="myStyle.css"/>
    <!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

    <!-- custom scrollbar stylesheet -->
    <asset:stylesheet href="jquery.mCustomScrollbar.css"/>

    <!-- demo CSS -->
    <style>
    .content{ height: 401px; }
    #sidebar{ float: right ; }
    </style>

</head>

<body>
<header>

    <div>
        <div style="float: left">
            <h1>Link sharing</h1>
        </div>

        <div style="float: right ; margin-top: 25px">
            <form method="get" action="/search" id="search" >
                <input name="q" type="text" size="40" placeholder="Search..." />
            </form>
        </div>
        <div style="clear: both"></div>
    </div>

</header>

<div id="demo" >
    <section id="examples" >

        <div id="sidebar" class="contentCred">
            <h3>LOGIN</h3>
            <hr/>
            <g:form name="loginForm" controller="login" action="validateCredential" >
                <p>username</p><g:textField name="username"/>
                <p>password</p><g:textField name="password"/><br><br>
                <g:submitButton name="submit" value="Login"/>
            </g:form><br>
            <hr/>
            <h3>Sign up</h3>
            <hr/>


                <fieldset>
                    <legend>Avatar Upload</legend>

                    <g:uploadForm name="register" controller="user" action="createUser">

                        <p>first name</p> <g:textField name="firstName"/>
                        <p>last name</p><g:textField name="lastName"/>
                        <p>email</p><g:textField name="email"/>
                        <p>username</p> <g:textField name="username"/>
                        <p>password</p><g:textField name="password"/>
                        <p>confirm password</p><g:textField name="confirmPassword"/><br><br>

                        <label for="avatar">Avatar (16K)</label>
                        <input type="file" name="avatar" id="avatar" />
                        <div style="font-size:0.8em; margin: 1.0em;">
                            For best results, your avatar should have a width-to-height ratio of 4:5.
                            For example, if your image is 80 pixels wide, it should be 100 pixels high.
                        </div>
                        <g:submitButton name="register" value="register"/>
                    </g:uploadForm>
                </fieldset>

        </div>


        <!-- content -->
       <h2>Recent shared</h2>
        <div  class="content " >
            <hr /><br>
            <ls:recentShares/>
            <hr />

        </div>




        <!-- content -->
        <h2>Top Posts</h2>
        <div   class="content ">
            <hr /><br>
            <ls:topPosts/>
            <hr />

        </div>
    </section>
</div>

<footer>

</footer>

<!-- Google CDN jQuery with fallback to local -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="jquery-1.11.0.min.js"><\/script>')</script>

<!-- custom scrollbar plugin -->
<script src="jquery.mCustomScrollbar.concat.min.js"></script>
<asset:javascript src="jquery.mCustomScrollbar.concat.min.js" />

<script>
    (function($){
        $(window).load(function(){

            $(".content").mCustomScrollbar({
                snapAmount:10,
                scrollButtons:{enable:true},
                keyboard:{scrollAmount:40},
                mouseWheel:{deltaFactor:40},
                scrollInertia:200
            });

        });
    })(jQuery);
</script>
</body>
</html>