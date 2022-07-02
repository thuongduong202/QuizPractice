
package Validation;

import Model.Register;
import java.util.Properties;
import java.util.Random;

import Model.User;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author dangm
 */
public class Utilities {

    // public String getRandom() {
    // Random rd = new Random();
    // int num = rd.nextInt(999999);
    // return String.format("%06d", num);
    // }
    //
    // public boolean sendEmail(Register register) {
    // boolean test = false;
    // //String code = getRandom();
    // String toEmail = register.getEmail();
    // String fromEmail = "QuizPractice@gmail.com";
    // String password = "Quiz11111";
    // try {
    // Properties pro = new Properties();
    // pro.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
    // pro.put("mail.smtp.port", "587"); // TLS Port
    // pro.put("mail.smtp.auth", "true"); // enable authentication
    // pro.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
    // Session session = Session.getInstance(pro, new Authenticator() {
    // @Override
    // protected PasswordAuthentication getPasswordAuthentication() {
    // return new PasswordAuthentication(fromEmail, password);
    // }
    // });
    // Message mess = new MimeMessage(session);
    // mess.setFrom(new InternetAddress(fromEmail));
    // mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    // mess.setSubject("User Email Verification");
    // mess.setText("Registered successfully.Please verify your account using this
    // code: " + register.getCode());
    // Transport.send(mess);
    // test = true;
    // } catch (Exception e) {
    // e.printStackTrace();
    // }
    //
    // return test;
    // }
    public static boolean sendEmail(String toEmail, String Subject, String msg) {
        boolean test = false;
        String fromEmail = "QuizPracticeSWP391@gmail.com";
//        String password = "Quiz11111";
        String password = "gjfuyrhepoicbjcd";
        try {
            Properties props = new Properties();
            // props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
            props.put("mail.smtp.port", "587"); // TLS Port
            props.put("mail.smtp.auth", "true"); // enable authentication
            props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            MimeMessage mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject(Subject);
            mess.setContent(msg, "text/html");
            Transport.send(mess);
            test = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return test;
    }

    public static String generateRandomCode() {
        String code = "";
        String s = "abcdefghijklmnopqrstuwxyzABCDYFGHIJKLMNOPQRSTUWXYZ1234567890";
        int charAt;
        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            charAt = random.nextInt(60);
            code += s.charAt(charAt);
        }
        return code;
    }
     public static void main(String[] args) {
     sendEmail("thuongdthe150682@fpt.edu.vn", "test", "1223");
     }

}
