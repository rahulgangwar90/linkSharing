package com.linkSharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


class UserController {

    static allowedMethods = [save: "GET", update: "PUT", delete: "DELETE"]
    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

    def index() {

    }

    def beforeInterceptor = [action: this.&myAction]

    def myAction() {
        println "inside my action"
    }


   /* def upload_avatar() {
        def user = springSecurityService.currentUser // or however you select the current user


    }*/

    // added by me

    def createUser(UserCO userCO){


        log.info "------------- creating user ----------"

        if(!userCO.validate()) {
            println "command object validation failed"
            println "error :" + userCO.errors
            render view: "/login/login", model: [user: userCO]
            return
        }

        def user = new User()
        user.properties = userCO.properties



        // Get the avatar file from the multi-part request
        def f = request.getFile('avatar')

        log.info "file type................ ${f.class}"
        log.info "file content ................${f.bytes}"


       // User user = new User(firstname: params.firstName , lastname: params.lastName , email: params.email,username: params.username, password: params.password)


        // List of OK mime-types
        if(f.bytes!=[]) {
            if (!okcontents.contains(f.getContentType())) {
                flash.message = "Avatar must be one of: ${okcontents}"
                render(view: '/login/login', model: [user: user])
                return
            }
            else{
                // Save the image and mime type
                user.avatar = f.bytes
                user.avatarType = f.contentType
            }
        }




        log.info("File uploaded: $user.avatarType")

        // Validation works, will check if the image is too big
        if (!user.save(flush: true)) {
            render(view:'/login/login', model:[user:user])
            return
        }


        if(user.hasErrors()){
            render "user not created !!! try again with valid values"
        }
        else{
            session.setAttribute("username",params.username)
            session.user = user
            redirect controller: "home" , action: "dashboard"
           // redirect(controller: "user", action: "loginHandler", params: user)
        }

    }

   /* def loginHandler(){

        session.user = params.user
       redirect controller: "home" , action: "dashboard"

    }*/


    def avatar_image() {
        def avatarUser = User.get(params.id)
        if (!avatarUser || !avatarUser.avatar || !avatarUser.avatarType) {
            response.sendError(404)
            return
        }
        response.contentType = avatarUser.avatarType
        response.contentLength = avatarUser.avatar.size()
        OutputStream out = response.outputStream
        out.write(avatarUser.avatar)
        out.close()
    }




    def showUserDetails(){

        log.info "displaying user details"

        render  "this page show user details"
    }

    //to display user list only to admin
    def list(){

        def userlist = User.list()

    }


}
