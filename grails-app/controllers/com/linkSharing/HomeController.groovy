package com.linkSharing

class HomeController {

    def index() {

        if(session.user){
            dashboard()

        }
        else{
            render view : "/login/login"
        }



    }

   def dashboard(){

       render view: "home"
   }
}
