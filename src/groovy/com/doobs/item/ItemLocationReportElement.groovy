package com.doobs.item

class ItemLocationReportElement implements Comparable {
	Integer count
	Location location
	
	public ItemLocationReportElement(Long count, Integer locationId) {
		this.count = count.intValue();
		this.location = Location.get(locationId);
	}
	
	public int compareTo(Object other) {
		return this?.location?.displayName?.compareTo(other?.location?.displayName)
	}

}
