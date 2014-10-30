package com.linkSharing

class LoginController {

    def index() {

    }

    def validateCredential(){

        def password =  params.password
        def username =  params.username

        def user = User.findByUsername(username)

        if(null == user){
            render "username not exist"
        }
        else{

            if(user.password == password){

                println "validating user credential"
                session.setAttribute("username",username)
                session.user = user
                redirect controller: "home" , action: "dashboard"
               // redirect(controller: "user", action: "loginHandler", params: user)

            }
            else{
                render "invalid username and password combination"
            }
        }

    }


    def logout(){

        session.invalidate()

        redirect controller: "home" , action: "index"
    }


}
