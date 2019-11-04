package com.supcon.mlp.lib.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * 
 * @author malipeng
 * @version 2014-11-07
 */
public class DateTime {
	static public Date AddHour(Date date, int hour){
		return AddDate(date, hour, Calendar.HOUR_OF_DAY);
	}
	static public Date AddMinute(Date date, int minute){
		return AddDate(date, minute, Calendar.MINUTE);
	}
	
	static public Date AddSecond(Date date, int second){
		return AddDate(date, second, Calendar.SECOND);
	}
	static public Date AddYear(Date date, int year){
		return AddDate(date, year, Calendar.YEAR);
		
	}
	static public Date AddMounth(Date date, int month){
		return AddDate(date, month, Calendar.MONTH);
	}
	static public Date AddDay(Date date ,int day){
		return AddDate(date, day, Calendar.DAY_OF_MONTH);
	}
	
	static public boolean Between(Date target, Date start, Date end){
		return (target.after(start) && target.before(end)) || target.compareTo(start) == 0 || target.compareTo(end) == 0;
	}
	static public Date Parse(String s) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.parse(s);
	}
	static public int getYear(Date date){
		Calendar calerdar = Calendar.getInstance();
		calerdar.setTime(date);
		return calerdar.get(Calendar.YEAR);
	}
	static public int getMonth(Date date){
		Calendar calerdar = Calendar.getInstance();
		calerdar.setTime(date);
		return calerdar.get(Calendar.MONTH) + 1;
	}
	static public int getDay(Date date){
		Calendar calerdar = Calendar.getInstance();
		calerdar.setTime(date);
		return calerdar.get(Calendar.DAY_OF_MONTH);
	}
	
	static public int getHour(Date date){
		Calendar calerdar = Calendar.getInstance();
		calerdar.setTime(date);
		return calerdar.get(Calendar.HOUR_OF_DAY);
	}
	static public int getMinute(Date date){
		Calendar calerdar = Calendar.getInstance();
		calerdar.setTime(date);
		return calerdar.get(Calendar.MINUTE);
	}
	static public int getSecond(Date date){
		Calendar calerdar = Calendar.getInstance();
		calerdar.setTime(date);
		return calerdar.get(Calendar.SECOND);
	}
	static private Date AddDate(Date date,int amount, int field){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(field, amount);
		return c.getTime();
	}
	
	/**
	 * 计算在时间startTime和endTime之间，有多少个frequency大小的时间片段
	 * @param startTime
	 * @param endTime
	 * @param frequency 
	 * 	一个片段的长度，毫秒
	 * @return
	 * 如果所求的时间间隔不被frequency整除，则返回多一个时间片段，例如10/3 = 4
	 */
	static public int periods(Date startTime, Date endTime, int frequency){
		int periodLength = (int) ((endTime.getTime() - startTime.getTime())/1000);// convert to seconds;
		if(periodLength < 0){
			return 1;
		}
		int periodCount = periodLength / frequency;
		
		if(periodCount * frequency < periodLength){
			periodCount++;
		}
		return periodCount;
	}
	
	public static void main(String[] arg){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d;
		try {
			d = df.parse("2014-02-01 00:00:00");
			System.out.println(DateTime.getYear(d));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
