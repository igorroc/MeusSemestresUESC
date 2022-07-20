package trainningSet;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class AttributeReaderTest {

	//@Test
	void testGetAttributeFromFile() {
		AttributeReader sr = new AttributeReader();
		ArrayList<InferenceAttribute> attrList;
		attrList = sr.getAttributeFromFile("fileTest.txt");
		assertEquals(5, attrList.size());
		
		//The first attribute must be Gender(Male, Female)
		InferenceAttribute attr = attrList.get(0);
		assertEquals("Gender", attr.getAttributeName());
		assertEquals("Male", attr.getAttributeValues().get(0));
		assertEquals("Male", attr.getAttributeValues().get(1));
		
		//The second attribute must be CarsOwn(0, 1, 2)
		attr = attrList.get(1);
		assertEquals("CarsOwn", attr.getAttributeName());
		assertEquals("0", attr.getAttributeValues().get(0));
		assertEquals("1", attr.getAttributeValues().get(1));
		assertEquals("2", attr.getAttributeValues().get(2));
		
		//The third attribute must be TrvCost(Cheap, Stand, Expens)
		attr = attrList.get(2);
		assertEquals("TrvCost", attr.getAttributeName());
		assertEquals("Cheap", attr.getAttributeValues().get(0));
		assertEquals("Stand", attr.getAttributeValues().get(1));
		assertEquals("Expens", attr.getAttributeValues().get(2));
		
		//The fourth attribute must be Income (Low, Medium, High)
		attr = attrList.get(3);
		assertEquals("Income", attr.getAttributeName());
		assertEquals("Low", attr.getAttributeValues().get(0));
		assertEquals("Medium", attr.getAttributeValues().get(1));
		assertEquals("High", attr.getAttributeValues().get(2));
		
		
		//The fifth attribute must be Transportation(Bus, Train, Car)
		attr = attrList.get(4);
		assertEquals("Transportation ", attr.getAttributeName());
		assertEquals("Bus", attr.getAttributeValues().get(0));
		assertEquals("Train", attr.getAttributeValues().get(1));
		assertEquals("Car", attr.getAttributeValues().get(2));
		
	}

	@Test
	void testExtractAttributes() {
		String line =  "Gender CarsOwn TrvCost Income Transportation";
		AttributeReader sr = new AttributeReader();
		ArrayList<InferenceAttribute> atributes = new ArrayList<InferenceAttribute>();
		sr.extractAttributes(line, atributes);
		assertEquals("Gender", atributes.get(0).getAttributeName());
		assertEquals("CarsOwn", atributes.get(1).getAttributeName());
		assertEquals("TrvCost", atributes.get(2).getAttributeName());
		assertEquals("Income", atributes.get(3).getAttributeName());
		assertEquals("Transportation", atributes.get(4).getAttributeName());
		
		//now testing wih different number of spaces
		line =  "Gender CarsOwn   TrvCost  Income Transportation";
		sr = new AttributeReader();
		atributes = new ArrayList<InferenceAttribute>();
		sr.extractAttributes(line, atributes);
		assertEquals("Gender", atributes.get(0).getAttributeName());
		assertEquals("CarsOwn", atributes.get(1).getAttributeName());
		assertEquals("TrvCost", atributes.get(2).getAttributeName());
		assertEquals("Income", atributes.get(3).getAttributeName());
		assertEquals("Transportation", atributes.get(4).getAttributeName());
	}
	
	@Test
	void testExtracttAttributesValues() {
		
		ArrayList<InferenceAttribute> atributes = new ArrayList<InferenceAttribute>();
		InferenceAttribute attr = new InferenceAttribute();
		attr.setAttributeName("Gender");
		atributes.add(attr);
		attr = new InferenceAttribute();
		attr.setAttributeName("CarsOwn");
		atributes.add(attr);
		attr = new InferenceAttribute();
		attr.setAttributeName("TrvCost");
		atributes.add(attr);
		attr = new InferenceAttribute();
		attr.setAttributeName("Income");
		atributes.add(attr);
		attr = new InferenceAttribute();
		attr.setAttributeName("Transportation");
		atributes.add(attr);
		//now, all attributes are into the attributes list. Lets insert the attributes values
		AttributeReader sr = new AttributeReader();
		String line = "Male      0    Cheap   Low    Bus";
		sr.extractAttributesValues(line, atributes);
		line = "Male      1    Cheap   Medium Bus";
		sr.extractAttributesValues(line, atributes);
		line = "Female    2    Expens  High   Car";
		sr.extractAttributesValues(line, atributes);
		//checking values
		attr = atributes.get(0); //Gender must have two values: Male and Female
		assertEquals("Male", attr.getAttributeValues().get(0));
		assertEquals("Female", attr.getAttributeValues().get(1));
		
		attr = atributes.get(1); //CarsOwn must have three values: 0, 1 and 2
		assertEquals("0", attr.getAttributeValues().get(0));
		assertEquals("1", attr.getAttributeValues().get(1));
		assertEquals("2", attr.getAttributeValues().get(2));
		
		attr = atributes.get(2); //TrvCost must have two values: Cheap and Expens
		assertEquals("Cheap", attr.getAttributeValues().get(0));
		assertEquals("Expens", attr.getAttributeValues().get(1));
		
		attr = atributes.get(3); //Income must have three values: Low, Medium and High
		assertEquals("Low", attr.getAttributeValues().get(0));
		assertEquals("Medium", attr.getAttributeValues().get(1));
		assertEquals("High", attr.getAttributeValues().get(2));
	
		attr = atributes.get(4); //Transportation must have two values: Bus and Car
		assertEquals("Bus", attr.getAttributeValues().get(0));
		assertEquals("Car", attr.getAttributeValues().get(1));
	}
	
	
	@Test
	void testInitDataStructure(){
		ArrayList<AttributeData> data = new ArrayList<AttributeData>();
		AttributeReader reader = new AttributeReader();
		reader.initDataStructure(5, data);
		assertEquals(5, data.size());
		
		data = new ArrayList<AttributeData>();
		reader.initDataStructure(3, data);
		assertEquals(3, data.size());
	}
	
	@Test
	void TestSplitData() {
		ArrayList<AttributeData> data = new ArrayList<AttributeData>();
		AttributeReader reader = new AttributeReader();
		reader.initDataStructure(5, data);
		String line;
		
		line = "Male      0    Cheap   Low    Bus";
		reader.splitData(line, data);
		line = "Male      1    Cheap   Medium Bus";
		reader.splitData(line, data);
		line = "Female    1    Cheap   Medium Train";
		reader.splitData(line, data);
		
		AttributeData attrData = data.get(0);
		assertEquals("Male", attrData.getData(0));
		assertEquals("Male", attrData.getData(1));
		assertEquals("Female", attrData.getData(2));
		
		attrData = data.get(1);
		assertEquals("0", attrData.getData(0));
		assertEquals("1", attrData.getData(1));
		assertEquals("1", attrData.getData(2));
		
		attrData = data.get(2);
		assertEquals("Cheap", attrData.getData(0));
		assertEquals("Cheap", attrData.getData(1));
		assertEquals("Cheap", attrData.getData(2));
		
		attrData = data.get(3);
		assertEquals("Low", attrData.getData(0));
		assertEquals("Medium", attrData.getData(1));
		assertEquals("Medium", attrData.getData(2));
		
		attrData = data.get(4);
		assertEquals("Bus", attrData.getData(0));
		assertEquals("Bus", attrData.getData(1));
		assertEquals("Train", attrData.getData(2));
		
	}

}
