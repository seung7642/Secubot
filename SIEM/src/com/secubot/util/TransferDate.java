package com.secubot.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TransferDate {

	public static String getDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
		Date nowDate = new Date();
		long diffmilliSecond = nowDate.getTime() - date.getTime();
		long diffDay = diffmilliSecond / (24 * 60 * 60 * 1000);
		long diffTime = diffmilliSecond / (60 * 60 * 1000);
		long diffMinute = diffmilliSecond / (60 * 1000);
		long diffSecond = diffmilliSecond / (1000);
		
		if (diffSecond < 60) {
			return "방금";
		}
		
		else if (diffMinute < 60) {
			return diffMinute + "분";
		}
		
		else if (diffTime < 24) {
			return diffTime + "시간";
		}
		
		else if (diffDay < 7) {
			return diffDay + "일";
		}
		
		return sdf.format(date);
	}
	
	public static String getRegularDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		return sdf.format(date);
	}
}
