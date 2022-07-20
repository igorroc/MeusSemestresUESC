package trainningSet;

import java.util.ArrayList;

public class AttributeData {
	//This class stores all data (a collumn) of an specific attribute
	ArrayList<String> dataList;

	public AttributeData() {
		dataList = new ArrayList<String>();
	}
	
	public void insertData(String data) {
		dataList.add(data);
	}
	
	public String getData(int pos) {
		return dataList.get(pos);
	}
	
	
}
