package com.doobs.item

import java.util.Date;

class ColorScheme {
	Long id
	String name
	String description
	Date dateCreated
	Date lastUpdated

	public String toString() {
		return this.name
	}

	static constraints = {
		name nullable:false
	}
	
	static mapping = {
		table 'item_color_scheme'
		id 				column: 'color_scheme_id', sqlType : "int"
		name			column: 'name'
		description		column: 'description'
	}
}
