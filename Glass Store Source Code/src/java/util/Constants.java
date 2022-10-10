/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * Oct 8, 2022      1.0                 Admin           First Implement
 */
package util;

/**
 * Constants.java
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
public class Constants {

    private String USER = "sa";
    private String PASS = "123";

    public Constants() {
    }

    public String getUSER() {
        return USER;
    }

    public void setUSER(String USER) {
        this.USER = USER;
    }

    public String getPASS() {
        return PASS;
    }

    public void setPASS(String PASS) {
        this.PASS = PASS;
    }
}
