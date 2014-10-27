<!DOCTYPE html>
<!--[if IE 8 ]><html lang="en" class="ie8"><![endif]-->
<!--[if IE 9 ]><html lang="en" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Home</title>
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
    .content{ height: 401px; width: 400px;}

    #inbox { float: right; width: 550px;}
    #userInformation { float: left; width: 500px; }
    #subscription { float: right; width: 550px;}
    #trending { float: left; width: 500px;}
    #shareLink { float: right; width: 550px;}
    #sendInvite { float: left; width: 500px;}
    #shareDoc { float: right; width: 550px;}
    #crtTopic { float: left; width: 500px;}
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

        <!-- content -->
        <div  class="content " id="inbox">
        <h2>Inbox</h2>
        <hr/>
        <ls:inbox/>
        </div>

        <div  class="content " id="userInformation">
            <h2>User Information</h2>
            <hr/>
            <ls:userData/>
            %{--<g:form controller="login" action="logout">--}%
                %{--<g:submitButton name="logout" />--}%
            %{--</g:form>--}%
        </div>

        <div  class="content " id="subscription">
            <h2>Subscription</h2>

        </div>
        <div  class="content " id="trending">
            <h2>Trending topics</h2>
            <hr /><br>
            <hr />

        </div>

        <div  class="content" id="shareLink">
            <h2>Share link</h2>
            <hr/><br>

            <g:form controller="home" action="shareLink" name="shareLinkRes">
                <table >
                    <tr>
                        <td>Link*</td><td><g:textField name="link"/></td>
                    </tr>
                    <tr>
                        <td>Description*</td><td><g:textArea name="description" /></td>
                    </tr>
                    <tr>
                        <td>Topic*</td><td><g:select name="criteria.topic" from="${topicList}" optionKey="id" optionValue="name" noSelection="['':'-Select topic-']"/></td>
                    </tr>
                    <tr>
                        <td>
                            <g:submitButton name="share" />
                        </td>
                    </tr>
                </table>
            </g:form>
        </div>

        <div  class="content" id="sendInvite">
            <h2>Send invitation</h2>
            <hr/><br><br><br><br>
            <g:form controller="home" action="sendInvitation" name="sendInvite">
                <table >
                    <tr>
                        <td>Email*</td><td><g:textField name="email"/></td>
                    </tr>
                    <tr>
                        <td>Topic*</td><td><g:select name="criteria.topic" from="${topicList}" optionKey="id" optionValue="name" noSelection="['':'-Select topic-']"/></td>
                    </tr>
                    <tr>
                        <td>
                            <g:submitButton name="Invite" />
                        </td>

                    </tr>
                </table>
            </g:form>
        </div>


        <div  class="content " id="shareDoc">
            <h2>Share document</h2>
            <hr/><br
            <g:form controller="user" action="createUser" name="shareDocRes">
                <table >
                    <tr>
                        <td>Document*</td><td><g:uploadForm name="myUpload">
                        <input type="file" name="myFile" />
                    </g:uploadForm></td>
                    </tr>
                    <tr>
                        <td>Description*</td><td><g:textArea name="description" /></td>
                    </tr>
                    <tr>
                        <td>Topic*</td><td><g:select name="criteria.topic" from="${topicList}" optionKey="id" optionValue="name" noSelection="['':'-Select topic-']"/></td>
                    </tr>
                    <tr>
                        <td>
                            <g:submitButton name="share" />
                        </td>
                    </tr>
                </table>
            </g:form>
        </div>

        <div  class="content" id="crtTopic">
            <h2>Create topic</h2>
            <hr/><br><br><br><br>
            <g:form controller="home" action="createTopic">
                <table >
                    <tr>
                        <td>Name*</td><td><g:textField name="topicName" /></td>
                    </tr>
                    <tr>
                        <td>Visibility*</td><td><g:select name="visibility" from="${com.linkSharing.Topic.Visibility.values()}" /></td>
                    </tr>
                    <tr>
                        <td>
                            <g:submitButton name="Save" />
                        </td>

                    </tr>
                </table>
            </g:form>

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