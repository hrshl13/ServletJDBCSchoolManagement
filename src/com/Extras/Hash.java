package com.Extras;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;

public class Hash {
    public static String encode(String input) {
        String code = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes(StandardCharsets.UTF_8));
            // Convert byte array into signum representation
            BigInteger number = new BigInteger(1, hash);

            // Convert message digest into hex value
            StringBuilder hexString = new StringBuilder(number.toString(16));

            // Pad with leading zeros
            while (hexString.length() < 32) {
                hexString.insert(0, '0');
            }

            code = hexString.toString();

        } catch (Exception e) {
            System.out.println(e);
        }
        return code;
    }
}
