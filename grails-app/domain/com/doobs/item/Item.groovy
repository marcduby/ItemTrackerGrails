package com.doobs.item

import java.util.Date;

class Item implements Comparable {
	Long id
	String name
	String description
	String condition
	Type type
	Location location
	ColorScheme colorScheme
	Date dateCreated
	Date lastUpdated

	public String toString() {
		return this.name
	}
	
	public int compareTo(Object object) {
		Item other = (Item)object;
		return this?.type?.displayName?.compareTo(other?.type?.displayName)
	}
	
	static constraints = {
		name nullable:false
		type nullable: false
		location nullable: false
		colorScheme nullable: true
	}
	
	static mapping = {
		table 'item_item'
		id 				column: 'item_id', sqlType : "int"
		name			column: 'name'
		description		column: 'description'
		condition		column: 'mint'
		type			column: 'type_id', sqlType : "int", fetch: 'join'
		location		column: 'location_id', sqlType : "int", fetch: 'join'
		colorScheme		column: 'color_scheme_id', sqlType : "int", fetch: 'join'
	}
}
