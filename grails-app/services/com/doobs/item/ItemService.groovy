package com.doobs.item

class ItemService {

	/**
	 * return the list of items by type id search
	 * 
	 * @param typeId				the type id to search by	
	 * @return						the list of items of that type
	 */
	List<Item> getItemsByTypeId(Long typeId) {
		List<Item> itemList = Item.findAllByType(Type.get(typeId))
		return itemList
	}
	
	/**
	 * return the list of items by location id search
	 * 
	 * @param typeId				the location id to search by	
	 * @return						the list of items of that location
	 */
	List<Item> getItemsByLocationId(Long locationId) {
		List<Item> itemList = Item.findAllByLocation(Location.get(locationId))
		return itemList
	}
	
	/**
	 * method to return all child nodes of a type that are leaf nodes (no children)
	 * 
	 * @return			all child nodes of a type that are leaf nodes (no children)
	 */
    List<Type> getLeafTypesForParent(String typeString) {
		// create data structures
		List<Type> typeList = new ArrayList<Type>();
		List<Type> allTypesList = Type.findAll();
		
		// get the EP3 type
		Type ep3Type = Type.findByName(typeString);
		
		// find all related children
		allTypesList.each { type ->
			if (type?.isChildOf(ep3Type)) {
				if (type?.subTypes?.size() == 0) {
					typeList.add(type);
				}
			}
		}
		// sort list
		Collections.sort(typeList);
		
		// return result
		return typeList;
    }

	List<Type> getSortedTypesWithAndForParent(String typeIdString) {
		List<Type> typeList = this.getSortedTypesForParent(typeIdString);
		
		// add parent and sort
		typeList.add(Type.get(Long.valueOf(typeIdString)));
		Collections.sort(typeList);
		
		// return result
		return typeList;
	}
	
	List<Type> getSortedTypesForParent(String typeIdString) {
		// create data structures
		Long typeId = Long.valueOf(typeIdString)
		List<Type> typeList = new ArrayList<Type>();
		List<Type> allTypesList = Type.findAll();
		
		// get the EP3 type
		Type parentType = Type.get(typeId);
		
		log.info "found parent type: " + parentType?.displayName 
		
		// find all related children
		allTypesList.each { type ->
			if (type?.isChildOf(parentType)) {
				typeList.add(type);
			}
		}
		
		// sort list
		Collections.sort(typeList);
		
		// return result
		return typeList;
	}
	
	/**
	 * return the sorted list of types
	 * 	
	 * @return			the sorted list of types
	 */
	List<Type> getSortedTypes() {
		// create data structures
		List<Type> typeList = Type.findAll();
		
		// sort list
		Collections.sort(typeList);
		
		// return result
		return typeList;
	}

}
