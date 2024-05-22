package com.smsb.helper;

import java.security.MessageDigest;

public class PasswordHashing {

	public String doHashing(String password) {

		try {

			MessageDigest msDigest = MessageDigest.getInstance("SHA");
			msDigest.update(password.getBytes());

			byte[] resultBytes = msDigest.digest();
			StringBuilder sb = new StringBuilder();

			for (byte b : resultBytes) {

				sb.append(String.format("%02x", b));

			}
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}
