package com.supcon.mlp.lib.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import com.supcon.orchid.foundation.entities.SystemCode;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;

/**
 * 于字符串相关的辅助方法
 * @author malipeng
 *
 */
abstract public class StringUtil {
	
	/**
	 * 判断字符串是否为空串
	 * @param s
	 * @return
	 */
	static public boolean isEmptyOrNull(String s){
		boolean result = (s==null || s.trim().isEmpty());
		return result;
	}
	/**
	 * 判断字符串是否为空串
	 * @param s
	 * @return
	 */
	static public boolean isNotEmptyOrNull(String s){
		return !isEmptyOrNull(s);
	}
	/**
	 * 比较两个字符串是否相等</br>
	 * 任意两个空字符串相等</br>
	 * 仅有一个字符串为空时，返回false</br>
	 * @param op1
	 * @param op2
	 * @return
	 */
	static public boolean stringEquals(String op1, String op2){
		if(op1 == null && op2 == null){
			return true;
		}
		if(op1 == null && op2 != null){
			return false;
		}
		if(op1 != null && op2 == null){
			return false;
		}
		return op1.equals(op2);
	}
	
	/**
	 * null 返回""空字符串
	 * @param str
	 * @return
	 */
	static public String stringTrim(Object str){
		if(str == null){
			return "";
		}
		return str.toString().trim();
	}
	
	/**
	 * 将表达式expression， 按照 LEFT_BRACE 和 RIGHT_BRACE 分割成多个字表达式的列表
	 * 例如表达式[a] + [b] 按照[ 和]进行分解，得到的是[a, b]数组
	 * @param expression
	 * @param LEFT_BRACE
	 * @param RIGHT_BRACE
	 * @return
	 */
	public static List<String> splitByCharPair(String expression, String LEFT_BRACE, String RIGHT_BRACE) {
		List<String> result = new ArrayList<String>();
		int preRightBrace = 0;
		int preLeftBrace = -1;
		while ((preLeftBrace = expression.indexOf(LEFT_BRACE, preRightBrace)) != -1) {
			preRightBrace = expression.indexOf(RIGHT_BRACE, preLeftBrace);
			String factor = expression.substring(preLeftBrace + 1, preRightBrace);
			result.add(factor);
		}
		return result;
	}
	
	private static ScriptEngineManager manager = new ScriptEngineManager();
	private static ScriptEngine engine = manager.getEngineByName("JavaScript");
	public static final String CODE_REGEX="\\[(?<item>[^\\[\\]]*)\\]";
	public static final String[] CODE_REGEX1={"(?<=\\()(.+?)(?=\\))","(?<=\\[)(.+?)(?=\\])","(?<=\\{)(.+?)(?=\\})"};

	/**
	 * 调用ScriptEngine执行js
	 * @param script
	 * @return
	 * @throws ScriptException
	 */
	public static Object eval(String script) throws ScriptException{
		return engine.eval(script);
	}
	
	public static String replaceAll(String regex,String content,String replace){
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(content);
		return matcher.replaceAll(replace);
	}
	
	public static Set<String> getCodes(String formula) {
		Set<String> codes = new HashSet<String>();
		if (null != formula && formula.length() > 0) {
			Pattern pattern = Pattern.compile(StringUtil.CODE_REGEX);
			Matcher matcher = pattern.matcher(formula);
			while (matcher.find()) {
				codes.add(matcher.group("item"));
			}
		}
		return codes;
	}

	public static Set<String> getCodesNew(String formula) {
		Set<String> codes = new HashSet<String>();
		if (null != formula && formula.length() > 0) {
			if (formula.indexOf("begin(") != -1 || formula.indexOf("end(") != -1) {
				formula.replace("begin", "");
				formula.replace("end", "");

				String code1 = matchCode("(", ")", formula);
				if (code1 != null) {
					codes.add(code1);
				}
			}

			String code2 = matchCode("[", "]", formula);
			if (code2 != null) {
				codes.add(code2);
			}
		}

		String code3 = matchCode("{", "}", formula);
		if (code3 != null) {

			codes.add(code3);
		}

		return codes;
	}

    public static String matchCode(String leftPair, String rightPair, String formula) {
        String code = null;
        if (leftPair==null||rightPair==null){
            leftPair="(";
            rightPair=")";
        }
        String regex =  CODE_REGEX1[0];
        if (leftPair.equals("[")) {
            regex = CODE_REGEX1[1];
        }
        if (leftPair.equals("{")) {
            regex = CODE_REGEX1[2];
        }
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(formula);

        while (matcher.find()) {
            code = matcher.group();
            if (code.indexOf(leftPair) != -1 || code.indexOf(rightPair) != -1) {
                code = code.replace(leftPair, "");
                code = code.replace(rightPair, "");
            }
        }
        return code;
    }




    /**
	 * 比较两个系统编码是否相等</br>
	 * 两个空的系统编码被认为是相等的</br>
	 * 如果只有一个系统编码为空，则被认为是不相等的 </br>
	 * 如果两个系统编码都不为空，则按照系统编码的id字符串比较结果。
	 * @param s1
	 * @param s2
	 * @return
	 */
	public static boolean scEquals(SystemCode s1, SystemCode s2){
		if(s1 == null && s2  == null)
			return true;
		if(s1 == null && s2 != null)
			return false;
		if(s1 != null && s2 == null)
			return false;
		return stringEquals(s1.getId(), s2.getId());
	}
}
