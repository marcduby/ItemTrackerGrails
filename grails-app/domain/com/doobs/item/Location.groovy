package com.doobs.item

import java.util.Date;

class Location implements Comparable {
	Long id
	String name
	String description
	Location parentLocation
	Set subLocations
	Date dateCreated
	Date lastUpdated

	public String toString() {
		return this.name
	}

	public String getDisplayName() {
		return (this.parentLocation == null ? this.name : this.parentLocation?.displayName + " - " + this.name)
	}
	
	public int compareTo(Object other) {
		Location otherType = (Location)other;
		return this?.displayName?.compareTo(otherType?.displayName);
	}

	Boolean isChildOf(Location location) {
		if (this.parentLocation == null) {
			return false;
		} else {
		  if (this.parentLocation?.id == location?.id) {
			  return true;
		  } else {
		    return this.parentLocation?.isChildOf(location);
		  }
		}
	} 
	
	static transients = ['displayName']
	
	static belongsTo = [parentLocation: Location]
	
	static hasMany = [subLocations: Location]
	
	static constraints = {
		name nullable:false
		parentLocation nullable:true
	}
	
	static mapping = {
		table 'item_location'
		id 				column: 'location_id', sqlType : "int"
		name			column: 'name'
		description		column: 'description'
		parentLocation	column: 'parent_location_id', sqlType : "int", fetch: 'join'
		subLocations	column: "parent_location_id"
	}
}
