package com.linkSharing

class GlobalFilters {

    def filters = {

        all(controller:'*', action:'*') {
            before = {

                log.info "request params: $params"

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }

        }

        allExceptLogin(controller:'login', action:'*',invert:true) {
            before = {


                if(!session.user){
                    render view : "/login/login"
                }
            }

        }







    }
}
