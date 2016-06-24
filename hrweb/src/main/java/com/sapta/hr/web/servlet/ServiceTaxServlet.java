package com.sapta.hr.web.servlet;

import java.io.IOException;
import java.net.URL;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sapta.hr.domainobject.EmpBonusDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.ServiceTaxDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.ServiceTaxService;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.HeaderFooterPDFUtil;
import com.sapta.hr.web.util.HeaderUtil;

@SuppressWarnings("serial")
@WebServlet("/empsevicetaxpdfreport")
public class ServiceTaxServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		List<ServiceTaxDO> servicetaxlist = null;
		List<VendorDO> vendorlist = null;
		
		PdfPTable horizontalrow = null;
		PdfPTable totalamount = null;
		PdfPTable tdsheading = null;
		PdfPTable tdsvalues = null;
		double totalpay = 0;
		
		NumberFormat decimalformat = NumberFormat.getInstance();
		decimalformat.setMinimumFractionDigits(2);
		Document document = new Document(PageSize.A4.rotate(), 35, 35, 20, 85);
		
		 
	try {
			BaseFont base = BaseFont.createFont("http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/font/Verdana.ttf", BaseFont.WINANSI, false);
			Font fontgry12 = new Font(base, 12, Font.BOLD, BaseColor.GRAY);
			Font fontgry10 = new Font(base, 10, Font.BOLD, BaseColor.GRAY);
			Font fontgry8 = new Font(base, 8, Font.BOLD, BaseColor.GRAY);
			Font fontgry6 = new Font(base, 6, Font.BOLD, BaseColor.GRAY);
	        Font font12 = new Font(base, 12, Font.BOLD, BaseColor.BLACK);
	        Font font10 = new Font(base, 10, Font.NORMAL, BaseColor.BLACK);
	        Font fontitalic10 = new Font(base, 10, Font.ITALIC, BaseColor.BLACK);
			Font font8 = new Font(base, 8, Font.NORMAL, BaseColor.BLACK);
			Font fontbold8 = new Font(base, 8, Font.BOLD, BaseColor.BLACK);
			Font font6 = new Font(base, 6, Font.NORMAL, BaseColor.BLACK);
			resp.setContentType("application/pdf");
			resp.setHeader("Content-Disposition","attachment; filename=\""+startDate+"_"+endDate+"_"+"EmpServicetax_Report.pdf\"");
			PdfWriter writer = PdfWriter.getInstance(document, resp.getOutputStream());
			
			PdfPTable header = HeaderUtil.getHeaderDetails(req);
		 	
			PdfPTable footer = FooterUtil.getFooterDetails(req);
		 	footer.setTotalWidth(845);
			HeaderFooterPDFUtil headerfooter = new HeaderFooterPDFUtil(header, footer);
			writer.setPageEvent(headerfooter);
			
		 	document.open();
			
			horizontalrow = new PdfPTable(1);
			horizontalrow.setWidthPercentage(100);
			horizontalrow.setSpacingBefore(25f);
			
			PdfPCell contenerowcell = new PdfPCell(new Paragraph("Service Tax report between"+" "+startDate+" and "+endDate, fontitalic10));
			contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenerowcell.setBorder(0);
			contenerowcell.setPaddingTop(-5);
			horizontalrow.addCell(contenerowcell);
			
			document.add(horizontalrow);		
					
			totalamount = new PdfPTable(1);
			totalamount.setWidthPercentage(100);
			totalamount.setSpacingBefore(10f);
			
			servicetaxlist = new ServiceTaxService().getFinancialYearservicetaxReport(CommonUtil.convertStringToDate(startDate), CommonUtil.convertStringToDate(endDate));
			for (ServiceTaxDO servicetaxDO : servicetaxlist) {
				totalpay = totalpay + (servicetaxDO.getAmount());
			}
			
			PdfPCell totalvalue = new PdfPCell(new Paragraph("Total : "+decimalformat.format(totalpay), fontbold8)); 
			totalvalue.setHorizontalAlignment(Element.ALIGN_RIGHT);
			totalvalue.setBorder(0);
			totalvalue.setPaddingTop(20);
			totalvalue.setPaddingBottom(15);
			totalvalue.setPaddingRight(0);
			totalamount.setWidthPercentage(100);
			totalamount.addCell(totalvalue);
			
			document.add(totalamount);
		
			tdsheading = new PdfPTable(5);
			tdsheading.setHorizontalAlignment(Element.ALIGN_LEFT);
			tdsheading.setWidthPercentage(100);
			tdsheading.setSpacingBefore(30f);
			tdsheading.setWidths(new float[]{15f,15f,15f,30f,15f});
			
			PdfPCell tdsId = new PdfPCell(new Paragraph("Tax Id", fontbold8));
			tdsId.setHorizontalAlignment(Element.ALIGN_CENTER);
			tdsId.setBackgroundColor(new BaseColor(211,211,211));
			tdsId.setBorderColor(BaseColor.GRAY);
			tdsId.setFixedHeight(15);
			tdsheading.addCell(tdsId);
			
			PdfPCell tds_empId = new PdfPCell(new Paragraph("Invoice Number", fontbold8));
			tds_empId.setHorizontalAlignment(Element.ALIGN_CENTER);
			tds_empId.setBackgroundColor(new BaseColor(211,211,211));
			tds_empId.setBorderColor(BaseColor.GRAY);
			tdsheading.addCell(tds_empId);
			
			
			PdfPCell tdsMonth = new PdfPCell(new Paragraph("Bonus month", fontbold8));
			tdsMonth.setHorizontalAlignment(Element.ALIGN_CENTER);
			tdsMonth.setBackgroundColor(new BaseColor(211,211,211));
			tdsMonth.setBorderColor(BaseColor.GRAY);
			tdsheading.addCell(tdsMonth);
			
			
			PdfPCell amount = new PdfPCell(new Paragraph("Tax Amount ", fontbold8));
			amount.setHorizontalAlignment(Element.ALIGN_CENTER);
			amount.setBackgroundColor(new BaseColor(211,211,211));
			amount.setBorderColor(BaseColor.GRAY);
			tdsheading.addCell(amount);
			
			PdfPCell comment = new PdfPCell(new Paragraph("Comment ", fontbold8));
			comment.setHorizontalAlignment(Element.ALIGN_CENTER);
			comment.setBackgroundColor(new BaseColor(211,211,211));
			comment.setBorderColor(BaseColor.GRAY);
			tdsheading.addCell(comment);
			document.add(tdsheading);
			
			for (ServiceTaxDO servicetaxDO : servicetaxlist) {
		
				tdsvalues = new PdfPTable(5);
				tdsvalues.setHorizontalAlignment(Element.ALIGN_LEFT);
				tdsvalues.setWidthPercentage(100);
				tdsvalues.setWidths(new float[]{15f,15f,15f,30f,15f});
				
				
				PdfPCell id_value = new PdfPCell(new Paragraph(servicetaxDO.getId().toString(), font8));
				id_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				id_value.setBorderColor(BaseColor.GRAY);
				id_value.setFixedHeight(15);
				tdsvalues.addCell(id_value);
				
				PdfPCell empId_value = new PdfPCell(new Paragraph(servicetaxDO.getInvoiceno(), font8));
				empId_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				empId_value.setBorderColor(BaseColor.GRAY);
				tdsvalues.addCell(empId_value);

				PdfPCell tdsMonth_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(servicetaxDO.getTaxmonth()), font8)); 
				tdsMonth_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				tdsMonth_value.setBorderColor(BaseColor.GRAY);
				tdsMonth_value.setPaddingRight(5);
				tdsvalues.addCell(tdsMonth_value);
				
				PdfPCell tds_amount = new PdfPCell(new Paragraph(decimalformat.format(servicetaxDO.getAmount()), font8));
				tds_amount.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tds_amount.setBorderColor(BaseColor.GRAY);
				tds_amount.setPaddingRight(5);
				tdsvalues.addCell(tds_amount);
					
				PdfPCell Comment = new PdfPCell(new Paragraph(servicetaxDO.getComments(), font8));
				Comment.setHorizontalAlignment(Element.ALIGN_LEFT);
				Comment.setBorderColor(BaseColor.GRAY);
				Comment.setPaddingRight(5);
				tdsvalues.addCell(Comment);
				
				document.add(tdsvalues);
			}	
			
			document.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	} 
}
