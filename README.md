# SWP391_SE1630-NET_Group1

Đây là project của nhóm 1, tên là Glass King (working title)

Code của nhóm ta để ở thư mục ```Source Code```

Document mọi người có thể xem ở trong thư mục ```Document```.

Database mọi người có thể xem ở trong thư mục ```Database```.

# Ghi chú

Trước khi bắn code lên (git push), mọi người lưu ý pull code về trước nhé. Xong rồi chạy thử project của mình xem có lỗi hay conflict không. Xong rồi mà ko còn vấn đề gì nữa, thì thông báo cho nhóm qua chat (ghi lại là mình đã thay đổi những gì). Nếu nhóm thấy ko có vấn đề gì thì ok, bắn lên nhé.

# Sử dụng Git

mọi người sử dụng git ghi nhớ các câu lệnh:

- lấy code lần đầu: 
```
git clone https://github.com/duyhung2h/SWP391_SE1630-NET_Group1.git
```

- pull code về (nhớ pull về trước khi update code lên)
```
git pull origin main
```

- Khi muốn push code lên, cần làm các bước sau
```
git add .
git commit -m "nêu lên những thay đổi"
git push
```

# Coding Convention

- Để chữ thường: Tên file JSP, tên biến,... Ví dụ:
```
login.jsp
panelLogin.jsp

string userPassword = "";
```


- In hoa chữ cái đầu: Tên java class, tên file java,... Ví dụ:
```
ConnectionDAO.java
LoginController.java

public class User {}

```

- Comment block trong file java:
```
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
```

