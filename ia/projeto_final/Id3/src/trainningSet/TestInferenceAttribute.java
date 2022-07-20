package trainningSet;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class TestInferenceAttribute {

	@Test
	void testAddValue() {
		InferenceAttribute attrib = new InferenceAttribute();
		attrib.addValue("Cebolinha");
		attrib.addValue("Cebolinha");
		attrib.addValue("Monica");
		attrib.addValue("Magali");
		attrib.addValue("Monica");
		
		//checking values
		assertEquals(3, attrib.getAttributeValues().size());
		assertEquals("Cebolinha", attrib.getAttributeValues().get(0));
		assertEquals("Monica", attrib.getAttributeValues().get(1));
		assertEquals("Magali", attrib.getAttributeValues().get(2));
	}

}
