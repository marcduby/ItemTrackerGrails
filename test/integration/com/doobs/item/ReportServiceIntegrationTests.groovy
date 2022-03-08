package com.doobs.item

import static org.junit.Assert.*
import org.junit.*

class ReportServiceIntegrationTests {
	ReportService reportService
	
    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testGetItemTypeCountReport() {
		List<ItemTypeReportElement> reportList = this.reportService.getItemTypeCountReport();
		assertEquals 10, reportList.size()
    }

	@Test
	void testGetItemLocationCountReport() {
		List<ItemLocationReportElement> reportList = this.reportService.getItemLocationCountReport();
		assertEquals 10, reportList.size()
	}

}
