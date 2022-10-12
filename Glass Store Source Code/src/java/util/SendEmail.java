/*
 * Copyright(C) 2022, GROUP 1 SWP391 SE1630-NET
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 23-09-2022      1.0                 HungND           First Implement
 */

package util;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * SendEmail.java
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
public class SendEmail {

    // Email destination, subject, message
    private String toEmail;
    private String subject;
    private String message;

    // Set destination, subject, message and send the email
    public SendEmail(String toEmail, String subject, String message) {
        this.toEmail = toEmail;
        this.subject = subject;
        this.message = message;
        this.sentEmail(toEmail, subject, message);
    }

    // Email and password of the sender
    private final String MAIL = "glassshopkteam@gmail.com";
    private final String PASSWORD = "Thunderbolt123";

    // Send the email
    public void sentEmail(String toEmail, String subject, String text) {

        // Config
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        System.setProperty("mail.mime.charset", "utf-8");

        // Authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MAIL, PASSWORD);
            }
        });         
                      
        // Mail info
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(text);

            Transport.send(message);
            System.out.println("Message sent successfully...");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
