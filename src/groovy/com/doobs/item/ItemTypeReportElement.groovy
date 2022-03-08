package com.doobs.item

class ItemTypeReportElement implements Comparable {
	Integer count
	Type type
	
	public ItemTypeReportElement(Long count, Integer typeId) {
		this.count = count.intValue();
		this.type = Type.get(typeId);
	}
	
	public int compareTo(Object other) {
		return this?.type?.displayName?.compareTo(other?.type?.displayName)
	}

}
