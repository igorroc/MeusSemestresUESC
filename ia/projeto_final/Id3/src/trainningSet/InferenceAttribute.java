package trainningSet;

import java.util.ArrayList;

public class InferenceAttribute {
	
	//To store each attribute and it's respectives values
	
	String attributeName;
	ArrayList<String> attributeValues;
	
	public ArrayList<String> getAttributeValues() {
		return attributeValues;
	}
	public String getAttributeName() {
		return attributeName;
	}
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
	
	public InferenceAttribute() {
		attributeValues = new ArrayList<String>();
	}
	
	/**
	 * This method adds a value into an attribute, if this values does not exists yet
	 * @param token
	 */
	public void addValue(String token) {
		if (!attributeValues.contains(token)) {
			attributeValues.add(token);
		}
		
	}
	
}
