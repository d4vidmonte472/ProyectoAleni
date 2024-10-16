/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cardionica.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;
/**
 *
 * @author esteb
 */
public class EmailUtil {
     public static void enviarCorreoConPDF(String destinatario, String asunto, String cuerpo, byte[] pdfAdjunto, String nombreArchivo) throws MessagingException {
        
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Credenciales
        final String username = "cardionicagt5@gmail.com";
        final String password = "zopk redg csks ilf"; // Cambia esto

    
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
        message.setSubject(asunto);

        // Cuerpo del mensaje
        MimeBodyPart mimeBodyPart = new MimeBodyPart();
        mimeBodyPart.setContent(cuerpo, "text/plain");

        // Adjunto PDF
        MimeBodyPart attachmentBodyPart = new MimeBodyPart();
        attachmentBodyPart.setContent(pdfAdjunto, "application/pdf");
        attachmentBodyPart.setFileName(nombreArchivo);

        // Combina las partes
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(mimeBodyPart);
        multipart.addBodyPart(attachmentBodyPart);

        // Establece el contenido del mensaje
        message.setContent(multipart);

        // Envía el mensaje
        Transport.send(message);
    }
}
