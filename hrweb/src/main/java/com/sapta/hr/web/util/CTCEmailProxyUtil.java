package com.sapta.hr.web.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;

import freemarker.template.Configuration;

/**
 * A utility class for sending e-mail messages
 * @author www.codejava.net
 *
 */
public class CTCEmailProxyUtil {
	public static void sendEmail(ByteArrayOutputStream baos, String startdate, String employeeid, String employeectc, final HttpServletRequest request, HttpServletResponse res) throws IOException, NumberFormatException, AppException, ServletException {
		
		List<EmployeeDO> employeeList = null;
		
		try{
			
			// sets SMTP server properties
			Properties properties = new Properties();
			properties.put(request.getServletContext().getInitParameter(CommonConstants.MAIL_SMTP_HOST), request.getServletContext().getInitParameter(CommonConstants.SMTP_GMAIL_COM));
			properties.put(request.getServletContext().getInitParameter(CommonConstants.MAIL_SMTP_PORT), request.getServletContext().getInitParameter(CommonConstants.MAIL_SMTP_PORT_NUMBER));
			properties.put(request.getServletContext().getInitParameter(CommonConstants.MAIL_SMTP_AUTH), CommonConstants.TRUE);
			properties.put(request.getServletContext().getInitParameter(CommonConstants.MAIL_SMTP_STARTTLS_ENABLE), CommonConstants.TRUE);
			
			employeeList = new EmployeeService().retriveById(Long.parseLong(employeeid));
	
			// creates a new session with an authenticator
			Authenticator auth = new Authenticator() {
				
				public PasswordAuthentication getPasswordAuthentication() {
					PasswordAuthentication passwordAuthentication = null;
					try {
						passwordAuthentication = new PasswordAuthentication(request.getServletContext().getInitParameter(CommonConstants.PAYROLL_EMAIL), 
								CommonUtil.decrypt(request.getServletContext().getInitParameter(CommonConstants.PAYROLL_PASSWORD)).substring(request.getServletContext().getInitParameter(CommonConstants.SALT).length()));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return passwordAuthentication;
				}
			};
	
			Session session = Session.getInstance(properties, auth);
	
			// creates a new e-mail message
			Message msg = new MimeMessage(session);
	
			msg.setFrom(new InternetAddress(request.getServletContext().getInitParameter(CommonConstants.PAYROLL_EMAIL)));
			if (employeeList != null && employeeList.size() > 0 ) {
				InternetAddress[] toAddresses = { new InternetAddress(employeeList.get(0).getEmail()) };
				InternetAddress[] ccAddresses = { new InternetAddress(request.getServletContext().getInitParameter(CommonConstants.HR_EMAIL))};
				msg.setRecipients(Message.RecipientType.CC, ccAddresses);
				msg.setRecipients(Message.RecipientType.TO, toAddresses);
			}
			
			msg.setSubject(CommonConstants.CTC_EMAIL_SUB+" "+startdate);
			msg.setSentDate(new Date());
	       
	        // Create the message part
	        BodyPart messageBodyPart = new MimeBodyPart();
	
	        Configuration cfg = new Configuration();
	        cfg.setDirectoryForTemplateLoading(new File(request.getServletContext().getRealPath("resources/templates")));
	        
	        freemarker.template.Template template = cfg.getTemplate("CTC_Email_template.ftl");
	        Map<String, String> rootMap = new HashMap<String, String>();
	       // String imagelocation = request.getServletContext().getRealPath("resources/images/logo.png");
	       
	        rootMap.put("name", employeeList.get(0).getFname() +" "+employeeList.get(0).getLname());
	        rootMap.put("from", startdate);
	        rootMap.put("ctc", employeectc);
	        Writer out = new StringWriter();
	        template.process(rootMap, out);

	        messageBodyPart.setContent(out.toString(), "text/html");
	       
	        // Create a multipart message
	        Multipart multipart = new MimeMultipart();
	
	        // Set text message part
	        multipart.addBodyPart(messageBodyPart);
	        
	        // Part two is attachment
	        messageBodyPart = new MimeBodyPart();
	        
	        DataSource source = new ByteArrayDataSource(baos.toByteArray(), CommonConstants.APPLICATION_PDF);
	        messageBodyPart.setDataHandler(new DataHandler(source));
	        messageBodyPart.setFileName(employeeid+"_"+startdate + CommonConstants.DOT_PDF);
	        multipart.addBodyPart(messageBodyPart);
	        
	        // Send the complete message parts
	        msg.setContent(multipart);
	
	        // Send message
	        Transport.send(msg);
	        request.setAttribute("resvalue", "true");
	        
		} catch(AddressException e){
			request.setAttribute("resvalue", "false");
		} catch(Exception e){
			request.setAttribute("resvalue", "false");
		}


	}
}
