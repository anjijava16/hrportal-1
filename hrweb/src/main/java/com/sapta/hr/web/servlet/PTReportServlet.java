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
import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.ProfessionalTaxService;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.HeaderFooterPDFUtil;
import com.sapta.hr.web.util.HeaderUtil;


@SuppressWarnings("serial")
@WebServlet("/ptpdfreport")
public class PTReportServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		List<ProfessionalTaxDO> ptlist = null;
		List<VendorDO> vendorlist = null;
		
		PdfPTable horizontalrow = null;
		PdfPTable totalamount = null;
		PdfPTable ptheading = null;
		PdfPTable ptvalues = null;
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
			resp.setHeader("Content-Disposition","attachment; filename=\""+startDate+"_"+endDate+"_"+"PT_Report.pdf\"");
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
			
			PdfPCell contenerowcell = new PdfPCell(new Paragraph("Professional tax report between"+" "+startDate+" and "+endDate, fontitalic10));
			contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenerowcell.setBorder(0);
			contenerowcell.setPaddingTop(-5);
			horizontalrow.addCell(contenerowcell);
			
			document.add(horizontalrow);		
					
			totalamount = new PdfPTable(1);
			totalamount.setWidthPercentage(100);
			totalamount.setSpacingBefore(10f);
			
			ptlist = new ProfessionalTaxService().getFinancialYearProfessionalTaxReport(CommonUtil.convertStringToDate(startDate), CommonUtil.convertStringToDate(endDate));
			for (ProfessionalTaxDO ProfessionalTaxDO : ptlist) {
				totalpay = totalpay + (ProfessionalTaxDO.getAmount());
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
		
			ptheading = new PdfPTable(3);
			ptheading.setHorizontalAlignment(Element.ALIGN_LEFT);
			ptheading.setWidthPercentage(100);
			ptheading.setSpacingBefore(30f);
			
			PdfPCell ptmonth = new PdfPCell(new Paragraph("PT Month", fontbold8));
			ptmonth.setHorizontalAlignment(Element.ALIGN_CENTER);
			ptmonth.setBackgroundColor(new BaseColor(211,211,211));
			ptmonth.setBorderColor(BaseColor.GRAY);
			ptheading.addCell(ptmonth);
			
			PdfPCell pt_empId = new PdfPCell(new Paragraph("Employee ID", fontbold8));
			pt_empId.setHorizontalAlignment(Element.ALIGN_CENTER);
			pt_empId.setBackgroundColor(new BaseColor(211,211,211));
			pt_empId.setBorderColor(BaseColor.GRAY);
			pt_empId.setFixedHeight(15);
			ptheading.addCell(pt_empId);
			
			PdfPCell ptAmount = new PdfPCell(new Paragraph("Amount", fontbold8));
			ptAmount.setHorizontalAlignment(Element.ALIGN_CENTER);
			ptAmount.setBackgroundColor(new BaseColor(211,211,211));
			ptAmount.setBorderColor(BaseColor.GRAY);
			ptheading.addCell(ptAmount);
			
			document.add(ptheading);
			
			for (ProfessionalTaxDO ProfessionalTaxDO : ptlist) {
		
				ptvalues = new PdfPTable(3);
				ptvalues.setHorizontalAlignment(Element.ALIGN_LEFT);
				ptvalues.setWidthPercentage(100);
				
				PdfPCell pt_month = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(ProfessionalTaxDO.getPtmonth()), font8));
				pt_month.setHorizontalAlignment(Element.ALIGN_CENTER);
				pt_month.setBorderColor(BaseColor.GRAY);
				ptvalues.addCell(pt_month);
				
				PdfPCell emp_id = new PdfPCell(new Paragraph(ProfessionalTaxDO.getEmpid().toString(), font8));
				emp_id.setHorizontalAlignment(Element.ALIGN_LEFT);
				emp_id.setBorderColor(BaseColor.GRAY);
				emp_id.setFixedHeight(15);
				ptvalues.addCell(emp_id);
	
				PdfPCell pt_amount = new PdfPCell(new Paragraph(decimalformat.format(ProfessionalTaxDO.getAmount()), font8));
				pt_amount.setHorizontalAlignment(Element.ALIGN_RIGHT);
				pt_amount.setBorderColor(BaseColor.GRAY);
				ptvalues.addCell(pt_amount);

				document.add(ptvalues);
			}	
			
			document.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	} 
}
