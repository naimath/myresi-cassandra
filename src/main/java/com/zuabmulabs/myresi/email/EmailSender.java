package com.zuabmulabs.myresi.email;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;


public class EmailSender {
	 
	 
    private MailSender mailSender;
 
    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }
 
 
    public void sendEmail(String fromEmail, String toEmail, String subject, String msg){
    	
    	SimpleMailMessage message = new SimpleMailMessage();
    	message.setFrom(fromEmail);
		message.setTo(toEmail);
		message.setSubject(subject);
		message.setText(msg);
		mailSender.send(message);
 
    }
 
 
}
