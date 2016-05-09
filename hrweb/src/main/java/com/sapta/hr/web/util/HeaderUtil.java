package com.sapta.hr.web.util;

import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

public class HeaderUtil {
	
	
	public static PdfPTable getHeaderDetails(HttpServletRequest req){
		PdfPTable header = new PdfPTable(1);
    	try{
	    	String imageUrl = "http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/images/logo.png";
	    	
	    	header.setWidthPercentage(100);
			Image image = Image.getInstance(imageUrl);
			image.scaleAbsolute(150f, 35f);
			PdfPCell cell = new PdfPCell(image);
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			cell.setVerticalAlignment(Element.ALIGN_TOP);
			cell.setPaddingTop(0);
			cell.setBorder(0);
			header.addCell(cell);
    	} catch(Exception e){
    		System.out.println(e.getStackTrace());
    	}
		return header;    
	}
	
}
