package com.zuabmulabs.myresi.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailSender {
	private static final Logger logger = Logger.getLogger(EmailSender.class);

	private JavaMailSender mailSender;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public boolean sendEmail(String fromEmail, String toEmail, String subject,	String htmlText) {

	
		MimeMessage mime = mailSender.createMimeMessage();
		MimeMessageHelper helper;
		try {

			helper = new MimeMessageHelper(mime, true);
			helper.setFrom(fromEmail);
			helper.setTo(toEmail);
			helper.setSubject(subject);
			helper.setText(htmlText,true);
		    this.mailSender.send(mime);
		} catch (MessagingException e) {
			logger.error(e);
			return false;
		}

		return true;
	}

}
