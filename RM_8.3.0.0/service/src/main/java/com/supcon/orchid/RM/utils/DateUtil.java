package com.supcon.orchid.RM.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {

	private static final long TICKS_AT_EPOCH = 621355968000000000L;
	private static final long TICKS_PER_MILLISECOND = 10000;
	private static TimeZone timeZone = TimeZone.getDefault();

	/**
	 * 适用于18位的时间戳字符串, 但转换之后的年份有问题
	 * 
	 * @param str
	 * @return
	 */
	public static Date fromTimeStamp2Jdate(String str) {
		if (!"0".equals(str)) {
			Calendar calendar = Calendar.getInstance(timeZone);
			calendar.setTimeInMillis((Long.parseLong(str) - TICKS_AT_EPOCH) / TICKS_PER_MILLISECOND);
			calendar.setTimeInMillis(calendar.getTimeInMillis() - calendar.getTimeZone().getRawOffset());
			return calendar.getTime();
		} else {
			return null;
		}
	}

	/**
	 * 时间戳转换成日期格式字符串, 适用于13位的时间戳字符串
	 * 
	 * @param seconds
	 *            13位的时间戳字符串
	 * @param formatStr
	 * @return
	 */
	public static Date timeStamp2Date(String seconds, String format) {
		if (seconds == null || seconds.isEmpty() || seconds.equals("null")) {
			return null;
		}
		if (format == null || format.isEmpty()) {
			format = "yyyy-MM-dd HH:mm:ss";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		// String timeString = sdf.format(new Date(Long.valueOf(seconds +
		// "000")));//转成13位timeStamp
		String timeString = sdf.format(new Date(Long.valueOf(seconds)));
		Date timeDate = null;
		try {
			timeDate = sdf.parse(timeString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return timeDate;
	}

	/**
	 * 日期格式字符串转换成时间戳, 返回13位的时间戳字符串
	 * 
	 * @param date
	 *            字符串日期
	 * @param format
	 *            如：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String date2TimeStamp(String date_str, String format) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			// return String.valueOf(sdf.parse(date_str).getTime() /
			// 1000);//返回10位timeStamp
			return String.valueOf(sdf.parse(date_str).getTime());// 返回13位timeStamp
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 取得当前时间戳, 若要精确到秒, t/1000
	 * 
	 * @return
	 */
	public static String getCurrentTimeStamp() {
		long time = System.currentTimeMillis();
		String t = String.valueOf(time);
		return t;
	}

	private final static long DIFF_UNIX_WIN_MS = 11644473600000L;
	private final static long MULTIPLE_MS_100NS = 10000;

	/**
	 * fileTime2JaveTime
	 * @param llt
	 * @return
	 */
	public static Date filetime2Date(long llt) {
		llt /= MULTIPLE_MS_100NS;
		llt -= DIFF_UNIX_WIN_MS;
		Date date = new Date();
		date.setTime(llt);
		return date;
	}
}
