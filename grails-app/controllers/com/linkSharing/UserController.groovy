package com.linkSharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


class UserController {

    static allowedMethods = [save: "GET", update: "PUT", delete: "DELETE"]

    def index() {

    }

    // added by me

    def createUser(){

        User user = new User(firstname: params.firstName , lastname: params.lastName , email: params.email,username: params.username, password: params.password)

        println user.dump()

        user.save(flush: true )

        if(user.hasErrors()){
            render "user not created !!! try again with valid values"
        }
        else{
            session.setAttribute("username",params.username)
            redirect(controller: "user", action: "loginHandler", params: user)
        }

    }

    def loginHandler(){

        session.user = params.user
       redirect controller: "home" , action: "dashboard"

    }
}
