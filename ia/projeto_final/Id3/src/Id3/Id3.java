package Id3;

import trainningSet.InferenceAttribute;
import trainningSet.TrainningSet;

public class Id3 {
	
	
/*
 * id3 (TrainingSet TS)
	be R the bert attribute in TS (entropy)
	root = R
	for each value v in R
		TS' = TS.subset(R, v)
		//TS' is the examples in TS with v and without R
		R.addBranch(id3(TS')
	return root 
 */
	/**
	 * This recursove method creates the 
	 * tree and returnd it's root 
	 * @param TS
	 * @return
	 */
	public Node findTree(TrainningSet TS) {
		InferenceAttribute currentAttribute = TS.bestEntropy();
		Node root = new Node(currentAttribute); //the root is defined
		for (String v:currentAttribute.getAttributeValues()) { //for each value v
			TrainningSet newTS = TS.getSubSet(currentAttribute, v); //creates the 
																	//subset with examples in TS with v 
																	//and without currentAttribute
			root.addBranch(v);
			root.addNode(findTree(newTS));
		}
		return root;
	}

}
