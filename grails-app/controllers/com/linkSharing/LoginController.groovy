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
                session.setAttribute("username",username)
                redirect(controller: "user", action: "loginHandler", params: user)

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
