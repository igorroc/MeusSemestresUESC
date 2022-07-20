package trainningSet;

import java.util.ArrayList;

public class TrainningSet {
	//Stores all trainning set data found in a specific file
	
	ArrayList<InferenceAttribute> attributesList;
	AttributeReader reader;
	ArrayList<AttributeData> dataAll;
	
	
	public TrainningSet(String fileName) {
		reader = new AttributeReader();
		attributesList = reader.getAttributeFromFile(fileName);
		dataAll = reader.getAttributesDataFromFile(fileName);
	}
	
	/**
	 * This method returns the best attribute (inference attribute)
	 * considering the entropy of all inference attributes
	 * @return
	 */
	public InferenceAttribute bestEntropy() {
		return null;
	}
	
	/**
	 * This method calculates the entropy of am inference attribute
	 * related to the class attirbute
	 * @param inferenceAttrib
	 * @param classAttrib
	 * @return
	 */
	public float entropy(InferenceAttribute inferenceAttrib, InferenceAttribute classAttrib) {
		return 0;
	}

	/**
	 * This method creates and returns a new trainningset
	 * formed by all examples where the currAttr value is V
	 * but without the currentAttribute
	 * (selects the value V and removes the attribute currAttr
	 * @param currAttr
	 * @param v
	 * @return
	 */
	public TrainningSet getSubSet(InferenceAttribute currAttr, String v) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
