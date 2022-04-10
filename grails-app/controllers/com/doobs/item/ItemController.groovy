package com.doobs.item

import org.springframework.dao.DataIntegrityViolationException

class ItemController {
	ItemService itemService
	ReportService reportService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		Integer itemTotal = 0;
        params.max = Math.min(max ?: 25, 100)
		List<ItemTypeReportElement> reportList = this.reportService.getItemTypeCountReport()
		
		reportList.each { item ->
			itemTotal = itemTotal + item.count
		}
		
        [reportList: reportList, reportListTotal: reportList.size(), itemTotal: itemTotal]
    }

    def listItemCountByLocation(Integer max) {
		Integer itemTotal = 0;
        params.max = Math.min(max ?: 25, 100)
		List<ItemLocationReportElement> reportList = this.reportService.getItemLocationCountReport()
		
		reportList.each { item ->
			itemTotal = itemTotal + item.count
		}
		
        [reportList: reportList, reportListTotal: reportList.size(), itemTotal: itemTotal]
    }

    def listItems(Integer max) {
        params.max = Math.min(max ?: 25, 100)
        [itemInstanceList: Item.list(params), itemInstanceTotal: Item.count()]
    }

    def listByType() {
		Integer itemTotal = 0;
		Long typeId = (params.id == null ? 0l : Long.valueOf(params.id))
		
		log.info "looking for items of type: " + typeId
		List<Item> itemList = this.itemService.getItemsByTypeId(typeId)
        Collections.sort(itemList)
		log.info "found: " + itemList.size() + " items of type: " + typeId
		
		itemList.each { item ->
			itemTotal = itemTotal + item.count
		}
		
        [itemList: itemList, itemListTotal: itemList.size(), itemTotal: itemTotal]
    }

    def listByLocation() {
		Long locationId = (params.id == null ? 0l : Long.valueOf(params.id))
		Location location = null;
		
		log.info "looking for items with location: " + locationId
		List<Item> itemList = this.itemService.getItemsByLocationId(locationId)
		log.info "found: " + itemList.size() + " items with location: " + locationId
		
		itemList.each { item ->
			location = item?.location
		}
		
		// sort list
		Collections.sort(itemList)
		
        [itemList: itemList, itemListTotal: itemList.size(), location: location]
    }

    def create() {
		List<Type> typeList = itemService?.getLeafTypesForParent("Star Wars")
		def myParams = params + ['location.id': session["location_id"]]
        List<Location> locationList = Location.list()
        Collections.sort(locationList)
        render(view: "create", model: [itemInstance: new Item(myParams), typeList: typeList, locationList: locationList])
    }

    def createCWItem() {
		List<Type> typeList = itemService?.getLeafTypesForParent("CW")
		def myParams = params + ['location.id': session["location_id"]]
        render(view: "create", model: [itemInstance: new Item(myParams), typeList: typeList])
    }

    def createEP2Item() {
		List<Type> typeList = itemService?.getLeafTypesForParent("EP2")
		def myParams = params + ['location.id': session["location_id"]]
        List<Location> locationList = Location.list()
        Collections.sort(locationList)
        render(view: "create", model: [itemInstance: new Item(myParams), typeList: typeList, locationList: locationList])
    }

	def createEP3Item() {
		List<Type> typeList = itemService?.getLeafTypesForParent("EP3")
		def myParams = params + ['location.id': session["location_id"]]
        render(view: "create", model: [itemInstance: new Item(myParams), typeList: typeList])
    }

    def createEP4Item() {
		List<Type> typeList = itemService?.getLeafTypesForParent("EP4")
		def myParams = params + ['location.id': session["location_id"]]
        render(view: "create", model: [itemInstance: new Item(myParams), typeList: typeList])
    }

    def createSagaItem() {
		List<Type> typeList = itemService?.getLeafTypesForParent("Saga")
		def myParams = params + ['location.id': session["location_id"]]
        render(view: "create", model: [itemInstance: new Item(myParams), typeList: typeList])
    }

    def createVehicleItem() {
		List<Type> typeList = itemService?.getLeafTypesForParent("Vehicles")
		def myParams = params + ['location.id': session["location_id"]]
        render(view: "create", model: [itemInstance: new Item(myParams), typeList: typeList])
    }

    def save() {
        def itemInstance = new Item(params)
		
		// get the location and cache if needed
		log.info params
		session["location_id"] = params.location.id
		
        if (!itemInstance.save(flush: true)) {
            render(view: "create", model: [itemInstance: itemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'item.label', default: 'Item'), itemInstance.id])
        redirect(action: "show", id: itemInstance.id)
    }

    def show(Long id) {
        def itemInstance = Item.get(id)
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), id])
            redirect(action: "list")
            return
        }

        [itemInstance: itemInstance]
    }

    def edit(Long id) {
        def itemInstance = Item.get(id)
		List<Type> typeList = itemService?.getLeafTypesForParent("Star Wars")
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), id])
            redirect(action: "list")
            return
        }

        List<Location> locationList = Location.list()
        Collections.sort(locationList)
        [itemInstance: itemInstance, typeList: typeList, locationList: locationList]
    }

    def update(Long id, Long version) {
        def itemInstance = Item.get(id)
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (itemInstance.version > version) {
                itemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'item.label', default: 'Item')] as Object[],
                          "Another user has updated this Item while you were editing")
                render(view: "edit", model: [itemInstance: itemInstance])
                return
            }
        }

        itemInstance.properties = params

        if (!itemInstance.save(flush: true)) {
            render(view: "edit", model: [itemInstance: itemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'item.label', default: 'Item'), itemInstance.id])
        redirect(action: "show", id: itemInstance.id)
    }

    def delete(Long id) {
        def itemInstance = Item.get(id)
        if (!itemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), id])
            redirect(action: "list")
            return
        }

        try {
            itemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'item.label', default: 'Item'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'item.label', default: 'Item'), id])
            redirect(action: "show", id: id)
        }
    }
}
