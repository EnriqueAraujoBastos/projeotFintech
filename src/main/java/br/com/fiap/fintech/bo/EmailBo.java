package br.com.fiap.fintech.bo;

import br.com.fiap.fintech.exception.EmailException;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class EmailBo{
    private static final String EMAIL_FROM = "enriquearaujobastos@gmail.com";
    private static final String APP_PASSWORD = "cvmq hsyu pfmm buwf";

    public void enviarEmail(
            String destinatario,
            String assunto,
            String mensagem) throws EmailException {

        Properties prop = new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM, APP_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_FROM));
            message.setRecipients(
                    Message.RecipientType.TO, InternetAddress.parse(destinatario));
            message.setSubject(assunto);
            message.setText(mensagem);
            Transport.send(message);
        } catch (MessagingException e) {
            throw new EmailException("Erro ao enviar e-mail: " + e.getMessage());
        }

    }

}