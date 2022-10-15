/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 23-09-2022      1.0                 HungND           First Implement
 */

package util;

import java.util.Random;

/**
 * GenerateRandomString.java
 *
 * Lớp này có...
 *
 * Thực hiện chức năng:
 *
 * Các phương thức sẽ trả về một đối tượng của lớp
 * <code>java.lang.Exception</code> khi có bất cứ lỗi nào xảy ra trong quá trình
 * truy vấn, cập nhật dữ liệu.
 * <p>
 * Bugs: ...	</p>
 *
 * @author Admin
 */
public class GenerateRandomString {

    /**
     * Generate a random number of type String
     * @param size: length of the number string
     * @return the string of number
     */
    public static String generateNumber(int size) {
        // These are the valid charecters use to random.
        String strValid = "0123456789";

        Random random = new Random();
        String mystring = "";
        for (int i = 0; i < size; i++) {
            int randnum = random.nextInt(strValid.length());
            mystring = mystring + strValid.charAt(randnum);
        }
        return mystring;
    }

    /**
     * Generate a random string
     * @param size: length of the string
     * @return the generated string
     */
    public static String generateString(int size) {
        String str = "abcdefghijklmnopqrstuvwxyz";
        String str1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String str2 = "0123456789";

        // These are the valid charecters use to random.
        String strValid = str + str1 + str2;

        Random random = new Random();
        String mystring = "";
        for (int i = 0; i < size; i++) {
            int randnum = random.nextInt(strValid.length());
            mystring = mystring + strValid.charAt(randnum);
        }
        return mystring;
    }
}
