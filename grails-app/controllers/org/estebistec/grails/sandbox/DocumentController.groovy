package org.estebistec.grails.sandbox

// TODO Turn this into a template that comes with a grails plugin...
class DocumentController {

    static allowedMethods = [createOrUpdate: "PUT", delete: "DELETE"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [documentInstanceList: Document.list(params), documentInstanceTotal: Document.count()]
    }

    // TODO create for POST

    def show = {
        def documentInstance = Document.get(params.id)
        if (!documentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])}"
            redirect(action: "list")
        }
        else {
            [documentInstance: documentInstance]
        }
    }

    // TODO Doh! Split these again and make create the POST method on the collection.
    // TODO Change url mappings too
    def createOrUpdate = {
        def documentInstance = Document.find(params.id)
        if(documentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (documentInstance.version > version) {
                    documentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'document.label', default: 'Document')] as Object[], "Another user has updated this Document while you were editing")
                    response.sendError 409, message(code: 'default.optimistic.locking.failure', args: [message(code: 'document.label', default: 'Document')])
                    // TODO Can views or converters set an error code?
                    //render(view: "edit", model: [documentInstance: documentInstance])
                    return
                }
            }
            documentInstance.properties = params
            if (!documentInstance.hasErrors() && documentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])}"
                redirect(action: "show", id: documentInstance.id)
            }
            else {
                response.sendError 400, "${documentInstance.errors}"
                // TODO Can views or converters set an error code?
                //render(view: "edit", model: [documentInstance: documentInstance])
                return
            }
        }
        else {
            documentInstance = new Document(params)
            if (documentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])}"
                // TODO 201 CREATED with Location
                redirect(action: "show", id: documentInstance.id)
            }
            else {
                // TODO 400 BAD REQUEST
                render(view: "create", model: [documentInstance: documentInstance])
            }
        }
    }

    def delete = {
        def documentInstance = Document.get(params.id)
        if (documentInstance) {
            try {
                documentInstance.delete(flush: true)
                // TODO 204 NO CONTENT?
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                // TODO 409 CONFLICT?
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            // TODO 204 NO CONTENT?
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])}"
            redirect(action: "list")
        }
    }
}
