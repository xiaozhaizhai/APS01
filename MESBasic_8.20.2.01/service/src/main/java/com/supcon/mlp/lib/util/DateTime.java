package com.supcon.mlp.lib.util;

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
		return target.after(start) && target.before(end);
	}
	
	static private Date AddDate(Date date,int amount, int field){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(field, amount);
		return c.getTime();
	}
	
	
}
