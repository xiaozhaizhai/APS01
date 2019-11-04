package com.supcon.mlp.lib.math;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * @author malipeng
 */
public class MathUtil {

    /**
     * 四舍五入
     *
     * @param digit 待转化的小数(Double)
     * @param n     保留的小数位数
     * @return
     */
    static public Double round(Double digit, int n) {
        if (n <= 0) {
            return 0d;
        }
        String strDigit = digit.toString();
        int p = strDigit.indexOf('.');
        if (p < 0) {
            return digit;
        }
        if (p + n + 1 < strDigit.length()) {
            strDigit = strDigit.substring(0, p + n + 1);
            return Double.parseDouble(strDigit);
        } else {
            return digit;
        }
    }
  
    /**
     * 四舍五入
     * @param digit
     * @param n
     * 	保留的小数位数
     * @return
     */
    /*
	static public BigDecimal round(BigDecimal digit, int n){
		if(digit == null || n <= 0){
			return new BigDecimal(0);
		}
		double v = digit.doubleValue();
		v = round(v, n);
		return new BigDecimal(v+"");
	}
   */

    /**
     * 四舍五入
     *
     * @param digit 待转化的小数(BigDecimal)
     * @param n     保留的小数位数
     * @return
     */
    static public BigDecimal round(BigDecimal digit, int n) {
        if (digit == null || n <= 0) {
            return new BigDecimal(0);
        }

        return digit.setScale(n, RoundingMode.HALF_UP);
    }

}
