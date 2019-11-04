package com.supcon.orchid.MESBasic.lib;

import java.util.ArrayList;
import java.util.List;



public class MainTest {
	static private char LEFT_BRACE = '[';
	static private char RIGHT_BRACE = ']';
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> factorList = getFactors("[a] + [b]");
		for(String s: factorList){
			System.out.println(s);
		}
	}
	static public List<String> getFactors(String expression) {
		List<String> factorList = new ArrayList<String>();
		int preRightBrace = 0;
		int preLeftBrace = -1;
		while ((preLeftBrace = expression.indexOf(LEFT_BRACE, preRightBrace)) != -1) {
			preRightBrace = expression.indexOf(RIGHT_BRACE, preLeftBrace);
			String factor = expression.substring(preLeftBrace+1, preRightBrace);
			
			factorList.add(factor);
			
		}
		
		return factorList;
	}
}
