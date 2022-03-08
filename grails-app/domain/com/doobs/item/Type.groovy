package com.doobs.item

class Type implements Comparable {
	Long id
	String name
	String description
	ColorScheme colorScheme
	Type parentType
	Set subTypes
	Date dateCreated
	Date lastUpdated
	
	public static final Long STAR_WARS 	= 1
	public static final Long VEHICLES 	= 3
	public static final Long CW 		= 5
	public static final Long EP2 		= 7
	public static final Long EP3 		= 8
	
	public String toString() {
		return this.name
	}
	
	public String getDisplayName() {
		return (this.parentType == null ? this.name : this.parentType?.displayName + " - " + this.name)
	}
	
	public int compareTo(Object other) {
		Type otherType = (Type)other;
		return this?.displayName?.compareTo(otherType?.displayName);
	}

	Boolean isChildOf(Type type) {
		if (this.parentType == null) {
			return false;
		} else {
		  if (this.parentType?.id == type?.id) {
			  return true;
		  } else {
		    return this.parentType?.isChildOf(type);
		  }
		}
	} 
	
	static transients = ['displayName']
	
	static belongsTo = [parentType: Type]
	
	static hasMany = [subTypes: Type]
	
	static constraints = {
		name nullable:false
		colorScheme nullable: true
		parentType nullable: true
	}
	
	static mapping = {
		table 'item_type'
		id 				column: 'type_id', sqlType : "int"
		name			column: 'name'
		description		column: 'description'
		parentType		column: 'parent_type_id', sqlType : "int", fetch: 'join'
		subTypes		column: "parent_type_id"
		colorScheme		column: 'color_scheme_id', sqlType : "int", fetch: 'join'
	}
}
