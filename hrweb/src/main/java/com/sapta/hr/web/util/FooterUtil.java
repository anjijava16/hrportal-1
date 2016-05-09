package com.sapta.hr.web.util;

import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.sapta.hr.domainobject.SaptaProfileDO;
import com.sapta.hr.service.SaptaProfileService;

public class FooterUtil {
	
	
	public static PdfPTable getFooterDetails(HttpServletRequest req){
		PdfPTable footer = null;
		try {
			BaseFont base = BaseFont.createFont("http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/font/lato/Lato-Medium.ttf", BaseFont.WINANSI, false);
			Font fontgry12 = new Font(base, 12, Font.BOLD, BaseColor.GRAY);
			Font fontgry8 = new Font(base, 8, Font.BOLD, BaseColor.GRAY);
			List<SaptaProfileDO> saptadetailslist = new SaptaProfileService().retriveList();
			for(SaptaProfileDO saptaprofile : saptadetailslist){
				footer = new PdfPTable(1);
		        footer.setTotalWidth(595); // 595 for portrait, 845 for landscape
		        PdfPCell cell1 = new PdfPCell(new Paragraph(saptaprofile.getCompanyname() +" | " + saptaprofile.getWebsite(), fontgry12));
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell1.setBorder(0);
		        cell1.setBorderWidthTop(0.5f);
		        cell1.setPaddingTop(3);
		        cell1.setBorderColorTop(BaseColor.GRAY);
		        footer.addCell(cell1);
		        cell1 = new PdfPCell(new Phrase(saptaprofile.getAddress()+", "+saptaprofile.getCity()+" - "+saptaprofile.getPincode()+", "+saptaprofile.getState()+", "+saptaprofile.getCountry(), fontgry8));
		        cell1.setBorder(0);
		        cell1.setPaddingTop(10);
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        footer.addCell(cell1);
		        cell1 = new PdfPCell(new Phrase("Off: +91 80 " + saptaprofile.getOfficephno() +" | Email: " + saptaprofile.getEmailid(), fontgry8));
		        cell1.setPaddingBottom(20);
		        cell1.setBorder(0);
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        footer.addCell(cell1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return footer;
	}
	
}
