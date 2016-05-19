package com.sapta.hr.web.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.codec.binary.Base64;

public final class CommonUtil {

	private CommonUtil() {

	}

	public static String convertDateToString(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		if(date != null){
			return formatter.format(date);
		}else{
			return null;
		}
	}
	
	public static String convertDateToStringWithOutTime(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		if(date != null){
			return formatter.format(date);
		}else{
			return null;
		}
	}
	
	public static String convertDateToStringWithOutTimeInvoice(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
		if(date != null){
			return formatter.format(date);
		}else{
			return null;
		}
	}
	
	public static String convertDateToStringWithdatetime(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("MMM yyyy");
		if(date != null){
			return formatter.format(date);
		}else{
			return null;
		}
	}
	
	
	
	public static Date convertStringToDate(String date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date dateResp = null;
		if(date != null){
			try{
				dateResp = formatter.parse(date);
			}catch(ParseException e){
				e.printStackTrace();
			}
		}else{
			dateResp =  null;
		}
		return dateResp;
	}
	
	public static Date convertStringToDateValue(String dateStr){
		DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
		String formatedDate = null;
		Date date = null;
		try{
			date = (Date)formatter.parse(dateStr);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			formatedDate = cal.get(Calendar.DATE) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" +  cal.get(Calendar.YEAR);
		}catch(ParseException e){
			e.printStackTrace();
		}
		SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");
		Date dateResp = null;
		if(date != null){
			try{
				dateResp = formatter1.parse(formatedDate);
			}catch(ParseException e){
				e.printStackTrace();
			}
		}else{
			dateResp =  null;
		}
		return dateResp;
	}
	
	
	public static Date convertStringToDateTime(String date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date dateResp = null;
		if(date != null){
			try{
				dateResp = formatter.parse(date);
			}catch(ParseException e){
				e.printStackTrace();
			}
		}else{
			dateResp =  null;
		}
		return dateResp;
	}
	
	public static Date convertStringToTime(String date){
		SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss");
		Date dateResp = null;
		if(date != null){
			try {
				dateResp = formatter.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}else{
			dateResp =  null;
		}
		return dateResp;
	}
	public static String convertDoubleValueWithTwoDecimalPoints(Double number){
		DecimalFormat format = new DecimalFormat("0.00");
	    String formatted = format.format(number);
	    return formatted;
	}
	
	public static String convertfloatValueWithTwoDecimalPoints(double number){
        DecimalFormat dec = new DecimalFormat("#.00");
        double rawPercent = ((double)(number)) * 1.00;
        String formatted = dec.format(rawPercent);
	    return formatted;
	}
	
	public static String convertnumberValueWithcomma(double value) {
	    if(value < 1000) {
	    	return new DecimalFormat("###.00").format(value);
	    } else {
	        double hundreds = value % 1000;
	        int other = (int)(value / 1000);
	        return new DecimalFormat(",##").format(other) + ',' + new DecimalFormat("000.00").format(hundreds);
	    }
	}
	
	public static float convertFloatWithDoublePrecision(float number){
		DecimalFormat df = new DecimalFormat();
		df.setMaximumFractionDigits(2);
		df.format(number);
	    return number;
	}
	
	public static double convertFloatWithDoublePrecision(double number){
		DecimalFormat df = new DecimalFormat();
		df.setMaximumFractionDigits(2);
		df.format(number);
	    return number;
	}
	
	
	 public static Double findExchangeRateAndConvert(String from, String to, double amount) {
        try {
            URL url = new URL("http://finance.yahoo.com/d/quotes.csv?f=l1&s="+ from + to + "=X");
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
            String line = reader.readLine();
            if (line.length() > 0) {
                return Double.parseDouble(line) * amount;
            }
            reader.close();
        } catch (Exception e) {
        }
        return null;
    }
	 
	 public static long convertDatesToDaysCount(Date startdate, Date enddate){
			long noofdays = 0;
			if(startdate != null && enddate != null){
				noofdays =  (enddate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24) + 1;
			}else{
				noofdays =  0;
			}
			return noofdays;
		}

	public static String encrypt( String salt, String plainText) throws Exception {
		Base64 base64 = new Base64();
		String Concatpassword = salt + plainText;
        String encoded = new String(base64.encode(Concatpassword.getBytes()));
        return encoded;
	}
	 
	public static String decrypt(String encryptedText) throws Exception {
		Base64 decoder = new Base64();
		String decoded = new String(decoder.decode(encryptedText.getBytes()));
		return decoded;
	}
}
