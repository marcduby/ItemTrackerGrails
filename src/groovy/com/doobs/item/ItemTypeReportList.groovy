package com.doobs.item

class ItemTypeReportList {
	Map<String, List<ItemTypeReportElement>> mapList = new HashMap<String, List<ItemTypeReportElement>>();
	
	public void add(String type, ItemTypeReportElement element) {
		this.getListForType(type).add(element)
	} 

	private List<ItemTypeReportElement> getListForType(String type) {
		List<ItemTypeReportElement> mapTypeList = this.mapList.get(type);
		 
		if (mapTypeList == null) {
			mapTypeList = new ArrayList<ItemTypeReportElement>();
			this.mapList.put(type,  mapTypeList)
		}
		
		return mapTypeList
	}
	
	public getList(String type) {
		
	}
}
