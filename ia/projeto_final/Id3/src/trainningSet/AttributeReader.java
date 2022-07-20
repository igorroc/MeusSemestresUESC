package trainningSet;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class AttributeReader {
	//to manipulate attributes from files
	
	
	/**
	 * This method gets all attributes and values from an specific file
	 * @param fileName
	 * @return
	 */
	public ArrayList<InferenceAttribute> getAttributeFromFile(String fileName) {
		ArrayList<InferenceAttribute> attributes = new ArrayList<InferenceAttribute>();
		

        try (BufferedReader br = Files.newBufferedReader(Paths.get(fileName))) {
            // read first line: the attributes names are there
            String line= br.readLine();
            extractAttributes(line, attributes);
            //now, inserting all attributes values
            while ((line = br.readLine()) != null) {
                extractAttributesValues(line, attributes);
            }

        } catch (IOException e) {
            System.err.format("IOException: %s%n", e);
        }
        return attributes;
	}
	
	/**
	 * This method inserts the attribute values from an specific attributesValues
	 * line. Note that it must only insert different (no repetitions allowed) values
	 * @param line
	 * @param attributes
	 */
	protected void extractAttributesValues(String line, ArrayList<InferenceAttribute> attributes) {
		StringTokenizer st = new StringTokenizer(line);
		String token;
		InferenceAttribute attr;
		int i=0;
		while (st.hasMoreTokens()) {
			token = st.nextToken(); //token has the attribute value
			attr = attributes.get(i);
			attr.addValue(token);
			i++;
		}
		
	}

	/**
	 * This method extracts attributes from a String
	 * @param line
	 * @param attributes
	 */
	protected void extractAttributes(String line, ArrayList<InferenceAttribute> attributes) {
		StringTokenizer st = new StringTokenizer(line);
		while (st.hasMoreTokens()) {
			InferenceAttribute inferenceAttribute = new InferenceAttribute();
			inferenceAttribute.setAttributeName(st.nextToken());
			attributes.add(inferenceAttribute);
		}
		
	}

	/**
	 * NOT TESTED
	 * This method extracts all data from an specific file and insert them into
	 * different AttributeData, according the respective collumn.
	 * The arraylist must contains one AttributeData for each collumn in the file
	 * @param fileName
	 * @return
	 */
	public ArrayList<AttributeData> getAttributesDataFromFile(String fileName) {
		
		ArrayList<AttributeData> data = new ArrayList<AttributeData>();
		
        try (BufferedReader br = Files.newBufferedReader(Paths.get(fileName))) {
            // read first line: the attributes names are there. They must be ignored now
            String line = br.readLine();
            StringTokenizer st = new StringTokenizer(line);
            initDataStructure(st.countTokens(), data);
            //now, extracting all attributes data
            while ((line = br.readLine()) != null) {
                splitData(line, data);
            }

        } catch (IOException e) {
            System.err.format("IOException: %s%n", e);
        }
		
		
		return data;
	}

	/**
	 * This method inits an arraylist of attributeData, creating
	 * a total of numberOfAttributes attribtesdata into them
	 * @param numberOfAttributes
	 * @param data 
	 * @return
	 */
	protected void initDataStructure(int numberOfAttributes, ArrayList<AttributeData> data) {
		for (int i=0;i<numberOfAttributes; i++) {
			AttributeData atrDt = new AttributeData();
			data.add(atrDt);
		}
	}

	/**
	 * NOT TESTED
	 * This method splits the data from a line, putting
	 * each of them in a specific arraylist, according the respective collumn
	 * @param line
	 * @param data
	 */
	protected void splitData(String line, ArrayList<AttributeData> data) {
		StringTokenizer st = new StringTokenizer(line);
		AttributeData atData;
		int i=0;
		while(st.hasMoreTokens()) {
			atData = data.get(i);
			atData.insertData(st.nextToken());
			i++;
		}
		
	}

}
