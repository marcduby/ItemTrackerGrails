package com.doobs.item

import org.springframework.dao.DataIntegrityViolationException

class TypeController {
	ItemService itemService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
		List<Type> typeList = itemService.getSortedTypes();
		
        [typeInstanceList: typeList, typeInstanceTotal: typeList.size()]
    }
	
	def listSpecific() {
		List<Type> typeList = itemService.getLeafTypesForParent(params.type)
		log.info "lissint types for parent: " + params.type
		
        render(view: "list", model: [typeInstanceList: typeList, typeInstanceTotal: typeList.size()])
	}

    def create() {
		List<Type> typeList = itemService.getSortedTypes();
		
        [typeInstance: new Type(params), typeInstanceList: typeList, typeInstanceTotal: typeList.size()]
    }

    def createForParent() {
		List<Type> typeList = itemService.getSortedTypesWithAndForParent(params.typeId)
		log.info "found: " + typeList.size() + " children type for parent: " + params.typeId
		
        render(view:"create", model: [typeInstance: new Type(params), parentList: typeList, typeInstanceTotal: typeList.size()])
    }

    def save() {
        def typeInstance = new Type(params)
        if (!typeInstance.save(flush: true)) {
            render(view: "create", model: [typeInstance: typeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'type.label', default: 'Type'), typeInstance.id])
        redirect(action: "show", id: typeInstance.id)
    }

    def show(Long id) {
        def typeInstance = Type.get(id)
        if (!typeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), id])
            redirect(action: "list")
            return
        }

        [typeInstance: typeInstance]
    }

    def edit(Long id) {
		List<Type> typeList = itemService.getSortedTypes();
        def typeInstance = Type.get(id)
		
        if (!typeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), id])
            redirect(action: "list")
            return
        }

        [typeInstance: typeInstance, typeInstanceList: typeList, typeInstanceTotal: typeList.size()]
    }

    def update(Long id, Long version) {
        def typeInstance = Type.get(id)
        if (!typeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (typeInstance.version > version) {
                typeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'type.label', default: 'Type')] as Object[],
                          "Another user has updated this Type while you were editing")
                render(view: "edit", model: [typeInstance: typeInstance])
                return
            }
        }

        typeInstance.properties = params

        if (!typeInstance.save(flush: true)) {
            render(view: "edit", model: [typeInstance: typeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'type.label', default: 'Type'), typeInstance.id])
        redirect(action: "show", id: typeInstance.id)
    }

    def delete(Long id) {
        def typeInstance = Type.get(id)
        if (!typeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), id])
            redirect(action: "list")
            return
        }

        try {
            typeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'type.label', default: 'Type'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'type.label', default: 'Type'), id])
            redirect(action: "show", id: id)
        }
    }
}
