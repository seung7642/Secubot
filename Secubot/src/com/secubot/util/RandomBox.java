package com.secubot.util;

import java.util.Random;

public class RandomBox {
	Random random = new Random();
	
	public static String getRandomRegisterCode() {
		Random random = new Random();
		random.setSeed(System.currentTimeMillis());
		int num = Math.abs(random.nextInt());
		return "U" + num;
	}
}