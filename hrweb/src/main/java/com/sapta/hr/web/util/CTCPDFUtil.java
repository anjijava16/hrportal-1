package com.sapta.hr.web.util;

import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;

public class CTCPDFUtil  extends PdfPageEventHelper {

	public PdfPTable revisionletter(HttpServletRequest req, BaseFont base, String employeeid, String startdate, String employeectc) {
		PdfPTable revisedletter = new PdfPTable(1);
		revisedletter.setSpacingBefore(50f);
		
		EmployeeDO employeeDO = null;
		Font font10 = new Font(base, 10, Font.NORMAL, BaseColor.BLACK);	
		Font fontbold10 = new Font(base, 10, Font.BOLD, BaseColor.BLACK);
		try{
			employeeDO = new EmployeeService().retriveById(Long.parseLong(employeeid)).get(0);
			PdfPCell heading_name = null;
			if(employeeDO.getMname() == null){
				heading_name = new PdfPCell(new Paragraph("Dear" + " " + employeeDO.getFname() +" "+employeeDO.getLname()+",", font10));
			}else{
				heading_name = new PdfPCell(new Paragraph("Dear" + " " + employeeDO.getFname() +" "+employeeDO.getMname()+" "+employeeDO.getLname()+",", font10));
			}
			heading_name.setHorizontalAlignment(Element.ALIGN_LEFT);
			heading_name.setPaddingTop(5);
			heading_name.setPaddingBottom(5);
			heading_name.setPaddingLeft(5);
			heading_name.setBorderColor(BaseColor.GRAY);
			heading_name.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(heading_name);
			
			Chunk CTC_REVISED_STAT1 = new Chunk(CommonConstants.CTC_REVISED_STAT1+" ", font10);
			Chunk employeeCTC = new Chunk(("Rs. "+employeectc+" "), fontbold10);
			Chunk CTC_REVISED_STAT2 = new Chunk(CommonConstants.CTC_REVISED_STAT2, font10);
			Chunk CTC_StartDate = new Chunk(" "+startdate+".", fontbold10);
			
			Paragraph revised_content = new Paragraph();
			revised_content.add(CTC_REVISED_STAT1);
			revised_content.add(employeeCTC);
			revised_content.add(CTC_REVISED_STAT2);
			revised_content.add(CTC_StartDate);
			
			PdfPCell content_one = new PdfPCell(revised_content); 
			content_one.setHorizontalAlignment(Element.ALIGN_LEFT);
			content_one.setPaddingTop(10);
			content_one.setPaddingBottom(5);
			content_one.setPaddingLeft(5);
			content_one.setBorderColor(BaseColor.GRAY);
			content_one.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(content_one);
			
			PdfPCell content_three = new PdfPCell(new Paragraph(CommonConstants.CTC_REVISED_STAT3, font10)); 
			content_three.setHorizontalAlignment(Element.ALIGN_LEFT);
			content_three.setPaddingTop(10);
			content_three.setPaddingBottom(5);
			content_three.setPaddingLeft(5);
			content_three.setBorderColor(BaseColor.GRAY);
			content_three.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(content_three);
			
			PdfPCell content_four = new PdfPCell(new Paragraph(CommonConstants.CTC_REVISED_STAT4, font10)); 
			content_four.setHorizontalAlignment(Element.ALIGN_LEFT);
			content_four.setPaddingTop(10);
			content_four.setPaddingBottom(5);
			content_four.setPaddingLeft(5);
			content_four.setBorderColor(BaseColor.GRAY);
			content_four.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(content_four);
			
			PdfPCell content_five = new PdfPCell(new Paragraph(CommonConstants.CTC_REVISED_STAT5, font10)); 
			content_five.setHorizontalAlignment(Element.ALIGN_LEFT);
			content_five.setPaddingTop(10);
			content_five.setPaddingBottom(5);
			content_five.setPaddingLeft(5);
			content_five.setBorderColor(BaseColor.GRAY);
			content_five.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(content_five);
			
			PdfPCell content_six = new PdfPCell(new Paragraph(CommonConstants.CTC_REVISED_STAT6, font10)); 
			content_six.setHorizontalAlignment(Element.ALIGN_LEFT);
			content_six.setPaddingTop(10);
			content_six.setPaddingBottom(5);
			content_six.setPaddingLeft(5);
			content_six.setBorderColor(BaseColor.GRAY);
			content_six.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(content_six);
			
			PdfPCell content_seven = new PdfPCell(new Paragraph(CommonConstants.CTC_REVISED_STAT7, font10)); 
			content_seven.setHorizontalAlignment(Element.ALIGN_LEFT);
			content_seven.setPaddingTop(10);
			content_seven.setPaddingBottom(5);
			content_seven.setPaddingLeft(5);
			content_seven.setBorderColor(BaseColor.GRAY);
			content_seven.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(content_seven);
			
			Chunk CTC_FOR = new Chunk("For"+" ", font10);
			Chunk CTC_REVISED_STAT8 = new Chunk(CommonConstants.CTC_REVISED_STAT8+" ", fontbold10);
			Paragraph company_content = new Paragraph();
			company_content.add(CTC_FOR);
			company_content.add(CTC_REVISED_STAT8);
			
			PdfPCell content_eight = new PdfPCell(company_content); 
			content_eight.setHorizontalAlignment(Element.ALIGN_LEFT);
			content_eight.setPaddingTop(10);
			content_eight.setPaddingBottom(5);
			content_eight.setPaddingLeft(5);
			content_eight.setBorderColor(BaseColor.GRAY);
			content_eight.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(content_eight);
			
			/*PdfPCell company_seal = new PdfPCell(new Paragraph("Comapny Seal", font10)); 
			company_seal.setHorizontalAlignment(Element.ALIGN_CENTER);
			company_seal.setPaddingTop(10);
			company_seal.setPaddingBottom(5);
			company_seal.setPaddingLeft(5);
			company_seal.setBorderColor(BaseColor.GRAY);
			company_seal.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(company_seal);*/
			
			/*PdfPCell hr_sign = new PdfPCell(new Paragraph(logo(req), font10)); 
			hr_sign.setHorizontalAlignment(Element.ALIGN_LEFT);
			hr_sign.setPaddingTop(10);
			hr_sign.setPaddingBottom(5);
			hr_sign.setPaddingLeft(5);
			hr_sign.setBorderColor(BaseColor.GRAY);
			hr_sign.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(hr_sign);*/
			String hr_signature = "http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/images/hr_sign.png";
	    	
			revisedletter.setWidthPercentage(100);
			Image image_sign = Image.getInstance(hr_signature);
			image_sign.scaleAbsolute(100f, 35f);
			PdfPCell hr_sign = new PdfPCell(image_sign);
			hr_sign.setPaddingTop(10);
			hr_sign.setHorizontalAlignment(Element.ALIGN_LEFT);
			hr_sign.setBorder(0);
			revisedletter.addCell(hr_sign);
			
			PdfPCell hr_manager = new PdfPCell(new Paragraph(CommonConstants.HR_NAME, fontbold10)); 
			hr_manager.setHorizontalAlignment(Element.ALIGN_LEFT);
			hr_manager.setPaddingTop(5);
			hr_manager.setPaddingBottom(5);
			hr_manager.setPaddingLeft(5);
			hr_manager.setBorderColor(BaseColor.GRAY);
			hr_manager.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(hr_manager);
			
			PdfPCell hr_dept = new PdfPCell(new Paragraph(CommonConstants.HR_DEPT, fontbold10)); 
			hr_dept.setHorizontalAlignment(Element.ALIGN_LEFT);
			hr_dept.setPaddingTop(5);
			hr_dept.setPaddingBottom(5);
			hr_dept.setPaddingLeft(5);
			hr_dept.setBorderColor(BaseColor.GRAY);
			hr_dept.setBorder(Rectangle.NO_BORDER);
			revisedletter.addCell(hr_dept);
			
			String seal_img = "http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/images/company_seal.png";
	    	
			revisedletter.setWidthPercentage(100);
			Image image_seal = Image.getInstance(seal_img);
			PdfPCell company_seal = new PdfPCell(image_seal);
			company_seal.setPaddingTop(10);
			company_seal.setHorizontalAlignment(Element.ALIGN_CENTER);
			company_seal.setBorder(0);
			revisedletter.addCell(company_seal);
			
		} catch(Exception e){
			System.out.println(e.getStackTrace());
		}
		
		
		
		return revisedletter;
	}
	
}
