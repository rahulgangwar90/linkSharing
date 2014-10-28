package com.linkSharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


class UserController {

    static allowedMethods = [save: "GET", update: "PUT", delete: "DELETE"]
    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

    def index() {

    }


    def upload_avatar() {
        def user = springSecurityService.currentUser // or however you select the current user


    }

    // added by me

    def createUser(){


        println "------------- creating user ----------"

        // Get the avatar file from the multi-part request
        def f = request.getFile('avatar')

        println "file type................ ${f.class}"
        println "file content ................${f.bytes}"


        User user = new User(firstname: params.firstName , lastname: params.lastName , email: params.email,username: params.username, password: params.password)


        // List of OK mime-types
        if(f.bytes!=[]) {
            println "in if============"
            if (!okcontents.contains(f.getContentType())) {
                flash.message = "Avatar must be one of: ${okcontents}"
                render(view: '/login/login', model: [user: user])
                return
            }
            else{
                println "in else==========="
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
        //flash.message = "Avatar (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."




        /*println user.dump()

        user.save(flush: true )*/

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

    def markAsRead(){

    }


}
