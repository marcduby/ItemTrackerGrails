package com.doobs.item

import groovy.sql.Sql;

class ReportService {
	def sessionFactory
	
	/**
	 * return list of item counts by type
	 * 
	 * @return					return list of item counts by type
	 */
    List<ItemTypeReportElement> getItemTypeCountReport() {
		Sql sql = new Sql( sessionFactory.currentSession.connection() )
		ItemTypeReportElement element = null;
		List<ItemTypeReportElement> reportList = new ArrayList<ItemTypeReportElement>();
		
		String sqlString = """
			select count(item.item_id) as counter, typ.type_id
			from item_item item, item_type typ
			where item.type_id = typ.type_id
			group by typ.type_id
		"""
		sql.eachRow(sqlString) {
			element = new ItemTypeReportElement(it.counter, it.type_id);
			reportList.add(element);
		}

		// log name change list
		log.info "found: " + reportList?.size() + " item types for the type count report"
		
		// sort list
		Collections.sort(reportList);
		
		return reportList
    }

	/**
	 * return the item count for locations
	 * 	
	 * @return					the item count for locations
	 */
	List<ItemLocationReportElement> getItemLocationCountReport() {
		Sql sql = new Sql( sessionFactory.currentSession.connection() )
		ItemLocationReportElement element = null;
		List<ItemLocationReportElement> reportList = new ArrayList<ItemLocationReportElement>();
		
		String sqlString = """
			select count(item.item_id) as counter, loc.location_id
			from item_item item, item_location loc
			where item.location_id = loc.location_id
			group by loc.location_id
		"""
		sql.eachRow(sqlString) {
			element = new ItemLocationReportElement(it.counter, it.location_id);
			reportList.add(element);
		}

		// log name change list
		log.info "found: " + reportList?.size() + " item locations for the location count report"
		
		// sort list
		Collections.sort(reportList);
		
		return reportList
	}

}
