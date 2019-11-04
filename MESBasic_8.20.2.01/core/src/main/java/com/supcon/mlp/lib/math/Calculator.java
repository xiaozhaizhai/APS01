package com.supcon.mlp.lib.math;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import com.supcon.mlp.lib.util.StringUtil;
/**
 * 
 * @author malipeng
 * @version 2014-11-07
 */
public class Calculator {
	private static Stack OPER; // 运算符栈
	private static Stack NUM; // 运算数栈
	private static ArrayList<String> arraylist; // 存储数据的容器
	String[] stri = new String[100];
	private final static char operatortable[][] = { // 存储各种运算符的优先级
			// + - * / ( ) # < 栈顶元素优先权低,压栈; > 退栈并将运算结果入栈
			{ '>', '>', '<', '<', '<', '>', '<' },
			{ '>', '>', '<', '<', '<', '>', '<' },
			{ '>', '>', '>', '>', '<', '>', '<' },
			{ '>', '>', '>', '>', '<', '>', '<' },
			{ '<', '<', '<', '<', '<', '=', '<' },
			{ '>', '>', '>', '>', 'F', '>', '<' },
			{ '<', '<', '<', '<', '<', '<', '<' } };

	static public Double scalculate(String expression){
		Calculator calculator = new Calculator();
		return calculator.calculate(expression);
	}
	
	static public Double scalculate(String exp, List<String> L1, List<String> params){
		Calculator calculator = new Calculator();
		return calculator.calculate(exp, L1, params);
	}
	
	static public Double scalculate(String exp, String[] L1, String[] params){
		Calculator calculator = new Calculator();
		return calculator.calculate(exp, L1, params);
	}
	
	private static ScriptEngineManager manager = new ScriptEngineManager();
	private static ScriptEngine engine = manager.getEngineByName("JavaScript");
	/**
	 * 调用ScriptEngine执行js
	 * @param script
	 * @return
	 * @throws NumberFormatException 
	 * @throws ScriptException
	 */
	public static Double scalculateJS(String script) throws NumberFormatException, ScriptException{
		Double result = Double.parseDouble(engine.eval(script).toString());
		return result;
	}
	
	public Calculator() {
		arraylist = new ArrayList<String>();
		OPER = new Stack();
		NUM = new Stack();
	}

	// 判断一个字符是否运算符
	public boolean isOperator(String ch) {
		if (ch.equals("+") || ch.equals("-") || ch.equals("*")
				|| ch.equals("/") || ch.equals("(") || ch.equals(")")) {
			return true;
		} else
			return false;
	}

	public boolean isOperator2(String ch) {
		if (ch.equals("0") || ch.equals("1") || ch.equals("2")
				|| ch.equals("3") || ch.equals("4") || ch.equals("5")
				|| ch.equals("6") || ch.equals("7") || ch.equals("8")
				|| ch.equals("9") || ch.equals(".")) {
			return true;
		} else
			return false;
	}

	// 判断优先级
	public char judge(String first, String second) {
		String[] index = { "+", "-", "*", "/", "(", ")", "#" };// 用于查找数组序列的一维数组
		int firstIndex = 0;
		int secondIndex = 0;
		// 寻找连个运算符的下标
		for (int i = 0; i < index.length; i++) {
			if (index[i].equals(first)) {
				firstIndex = i;
			}
			if (index[i].equals(second)) {
				secondIndex = i;
			}
		}
		return operatortable[firstIndex][secondIndex];
	}

	// 把字符串输入到arraylist中
	public ArrayList getExpression(String string) {
		char[] strArray = new char[string.length()];
		string.getChars(0, string.length(), strArray, 0);
		String result = "";
		for (int i = 0; i < strArray.length; i++) {
			String s = strArray[i] + "";

			boolean a = isOperator(s); // 运算符
			boolean b = isOperator2(s); // 数字
			if (a) {
				if (!result.equals("")) {
					arraylist.add(result);
				}
				result = "";
				arraylist.add(s);
			} else if (b) {
				result = result + s;
			}
		}
		arraylist.add(result);
		return arraylist;
	}

	// 判断运算符，进行运算
	public Double arit(Double FirstNum, Double SecondNum, String arit) {
		Double sum = 0d;
		if (arit.equals("+")) {
			sum = FirstNum + SecondNum;
		} else if (arit.equals("-")) {
			sum = SecondNum - FirstNum;
		} else if (arit.equals("*")) {
			sum = SecondNum * FirstNum;
		} else if (arit.equals("/")) {
			sum = SecondNum / FirstNum;
		}
		return sum;
	}

	public Double calculate(String formula, String[] args, String[] value){
		if(args.length != value.length){
			return 0d;
		}
		for(int i = 0; i < args.length; i++){
			if(StringUtil.isEmptyOrNull(value[i])){
				return 0d;
			}
			if(value[i].charAt(0) == '-'){
				if(value[i].length() > 1){
					formula = formula.replace(args[i], "(0-" + value[i].substring(1) + ")");
				}else{
					return 0d;
				}
			}else{
				formula = formula.replace(args[i], "(" + value[i] + ")");
			}
		}
		return calculate(formula);
	}
	public Double calculate(String formula, List<String> args, List<String> value){
		if(args.size() != value.size()){
			return 0d;
		}
		for(int i = 0; i < args.size(); i++){
			if(StringUtil.isEmptyOrNull(value.get(i))){
				return 0d;
			}
			if(value.get(i).charAt(0) == '-'){
				if(value.get(i).length() > 1){
					formula = formula.replace(args.get(i), "(0-" + value.get(i).substring(1) + ")");
				}else{
					return 0d;
				}
			}else{
				formula = formula.replace(args.get(i), "(" + value.get(i) + ")");
			}
		}
		return calculate(formula);
	}
	// 判断优先级，进栈或者运算
	public Double calculate(String opera) {
		arraylist = getExpression(opera);
		OPER.push('#');
		int i = 0;
		Double a, b;
		String c;
		while (i < arraylist.size()) {
			String s = arraylist.get(i);
			if (arraylist.get(i) == "") {
				i++;
			} else if (isOperator(s)) {
				switch (judge(OPER.peek().toString(), s)) {
				case '<':
					OPER.push(s);
					i++;
					break;
				case '>':
					c = OPER.pop().toString();
					a = Double.parseDouble(NUM.pop().toString());
					b = Double.parseDouble(NUM.pop().toString());
					NUM.push(arit(a, b, c));
					break;
				case '=':
					OPER.pop();
					i++;
					break;
				}
			} else {
				NUM.push(s);
				i++;
			}
		}
		while (!(OPER.peek().toString()).equals("#")) {
			c = OPER.pop().toString();
			a = Double.parseDouble(NUM.pop().toString());
			b = Double.parseDouble(NUM.pop().toString());

			NUM.push(arit(a, b, c));
		}
		return Double.parseDouble(NUM.peek().toString());
	}

	public static void main(String args[]) {
		String f = "5*6+1都交罚款等肌肤";
		try {
			System.out.println(Calculator.scalculateJS(f) + "");
		} catch (NumberFormatException | ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
