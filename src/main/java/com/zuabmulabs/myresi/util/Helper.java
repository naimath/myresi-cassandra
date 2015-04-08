package com.zuabmulabs.myresi.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

import com.zuabmulabs.myresi.controller.CustomAuthenticationProvider;

public class Helper {
	private static final Logger logger = Logger.getLogger(CustomAuthenticationProvider.class);
	
	public static String getMd5String(String string){
		try {
			MessageDigest md;
			md = MessageDigest.getInstance("MD5");
			md.update(string.getBytes());
			byte byteData[] = md.digest();
		      //convert the byte to hex format method 2
	        StringBuffer hexString = new StringBuffer();
	    	for (int i=0;i<byteData.length;i++) {
	    		String hex=Integer.toHexString(0xff & byteData[i]);
	   	     	if(hex.length()==1) hexString.append('0');
	   	     	hexString.append(hex);
	    	}
	    	return hexString.toString();	
			
		} catch (NoSuchAlgorithmException e) {
			logger.error(e);
		}		
		return null;
		
	}
}
