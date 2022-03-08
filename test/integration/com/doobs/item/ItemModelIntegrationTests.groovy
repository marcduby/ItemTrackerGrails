package com.doobs.item

import static org.junit.Assert.*
import org.junit.*

class ItemModelIntegrationTests {

    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testTypeModel() {
		List<Type> typeList = Type.findAll()
		assertEquals 0, typeList.size()
    }
	
	@Test
	void testLocationModel() {
		List<Location> locationList = Location.findAll()
		assertEquals 0, locationList.size()
	}

	@Test
	void testItemModel() {
		List<Item> itemList = Item.findAll()
		assertEquals 0, itemList.size()
	}

	@Test
	void testColorSchemeModel() {
		List<ColorScheme> colorSchemeList = ColorScheme.findAll()
		assertEquals 0, colorSchemeList.size()
	}

}
