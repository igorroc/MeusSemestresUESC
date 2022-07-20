package Id3;

import java.util.ArrayList;

import trainningSet.InferenceAttribute;

public class Node {
	
	InferenceAttribute attribute;
	String value;
	private ArrayList<Node> sons;
	private ArrayList<String> branches;
	
	/**
	 * Constructor to build a not leaf node
	 * This nodes are atributes and it's possible
	 * values determines it's sons
	 */
	Node (InferenceAttribute attrib) {
		attribute = attrib;
		value = null;
		sons = new ArrayList<Node>();
		branches = new ArrayList<String>();
	}
	
	/**
	 * Constructor to build a leaf node
	 * This nodes are values of the predictable attribute
	 * @param value
	 */
	Node (String value) {
		attribute = null;
		this.value = value;
		sons = null;
		branches = null;
	}

	/**
	 * This method adds the branch in this node
	 * @param v
	 */
	public void addBranch(String v) {
		branches.add(v);
	}

	/**
	 * This method adds a node as
	 * a son if this node
	 * @param node
	 */
	public void addNode(Node node) {
		sons.add(node);
		
	}
	
}
