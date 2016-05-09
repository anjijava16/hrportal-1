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
import com.sapta.hr.domainobject.BillsDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.BillsService;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.HeaderFooterPDFUtil;
import com.sapta.hr.web.util.HeaderUtil;


@SuppressWarnings("serial")
@WebServlet("/billspdfreport")
public class BillsReportServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		List<BillsDO> billslist = null;
		List<VendorDO> vendorlist = null;
		
		
		PdfPTable horizontalrow = null;
		PdfPTable totalamount = null;
		PdfPTable billsheading = null;
		PdfPTable billsvalues = null;
		PdfPTable totalbillscount = null;
		
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
			resp.setHeader("Content-Disposition","attachment; filename=\""+startDate+"_"+endDate+"_"+"Bills_Report.pdf\"");
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

			PdfPCell contenerowcell = new PdfPCell(new Paragraph("Bills report between"+" "+startDate+" and "+endDate, fontitalic10));
			contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenerowcell.setBorder(0);
			contenerowcell.setPaddingTop(-5);
			horizontalrow.addCell(contenerowcell);
			
			document.add(horizontalrow);		
			
			billslist = new BillsService().getFinancialYearBillsReport(CommonUtil.convertStringToDate(startDate), CommonUtil.convertStringToDate(endDate), 'i');
			for (BillsDO billsDO : billslist) {
				totalpay = totalpay + (billsDO.getDueamount());
			}
			
			totalbillscount = new PdfPTable(1);
			totalbillscount.setWidthPercentage(100);
			totalbillscount.setSpacingBefore(10f);
			
			PdfPCell totalnooflist = new PdfPCell(new Paragraph("No of Bills : "+billslist.size(), fontbold8)); 
			totalnooflist.setHorizontalAlignment(Element.ALIGN_RIGHT);
			totalnooflist.setBorder(0);
			totalnooflist.setPaddingTop(20);
			totalnooflist.setPaddingBottom(15);
			totalnooflist.setPaddingRight(45);
			totalbillscount.setWidthPercentage(100);
			totalbillscount.addCell(totalnooflist);
			
			document.add(totalbillscount);
			
			totalamount = new PdfPTable(1);
			totalamount.setWidthPercentage(100);
			/*totalamount.setSpacingBefore(10f);*/
			
			PdfPCell totalvalue = new PdfPCell(new Paragraph("Total : "+decimalformat.format(totalpay), fontbold8)); 
			totalvalue.setHorizontalAlignment(Element.ALIGN_RIGHT);
			totalvalue.setBorder(0);
			totalvalue.setPaddingBottom(15);
			totalvalue.setPaddingRight(0);
			totalamount.setWidthPercentage(100);
			totalamount.addCell(totalvalue);
			
			document.add(totalamount);
			
			billsheading = new PdfPTable(6);
			billsheading.setHorizontalAlignment(Element.ALIGN_LEFT);
			billsheading.setWidthPercentage(100);
			billsheading.setSpacingBefore(30f);
			billsheading.setWidths(new float[]{15f,15f,15f,15f,15f,25f});
			
			PdfPCell billdate = new PdfPCell(new Paragraph("Bill Date", fontbold8));
			billdate.setHorizontalAlignment(Element.ALIGN_CENTER);
			billdate.setBackgroundColor(new BaseColor(211,211,211));
			billdate.setBorderColor(BaseColor.GRAY);
			billsheading.addCell(billdate);
			
			PdfPCell billno = new PdfPCell(new Paragraph("Bill No", fontbold8));
			billno.setHorizontalAlignment(Element.ALIGN_CENTER);
			billno.setBackgroundColor(new BaseColor(211,211,211));
			billno.setBorderColor(BaseColor.GRAY);
			billno.setFixedHeight(15);
			billsheading.addCell(billno);
			
			PdfPCell vendorname = new PdfPCell(new Paragraph("Vendor Name", fontbold8));
			vendorname.setHorizontalAlignment(Element.ALIGN_CENTER);
			vendorname.setBackgroundColor(new BaseColor(211,211,211));
			vendorname.setBorderColor(BaseColor.GRAY);
			billsheading.addCell(vendorname);
			
			PdfPCell paidon = new PdfPCell(new Paragraph("Paid On", fontbold8));
			paidon.setHorizontalAlignment(Element.ALIGN_CENTER);
			paidon.setBackgroundColor(new BaseColor(211,211,211));
			paidon.setBorderColor(BaseColor.GRAY);
			billsheading.addCell(paidon);
			
			PdfPCell amount = new PdfPCell(new Paragraph("Amount ", fontbold8));
			amount.setHorizontalAlignment(Element.ALIGN_CENTER);
			amount.setBackgroundColor(new BaseColor(211,211,211));
			amount.setBorderColor(BaseColor.GRAY);
			billsheading.addCell(amount);
			
			PdfPCell comments = new PdfPCell(new Paragraph("Comments", fontbold8));
			comments.setHorizontalAlignment(Element.ALIGN_CENTER);
			comments.setBackgroundColor(new BaseColor(211,211,211));
			comments.setBorderColor(BaseColor.GRAY);
			billsheading.addCell(comments);
			
			document.add(billsheading);
			
			for (BillsDO billsDO : billslist) {
		
				billsvalues = new PdfPTable(6);
				billsvalues.setHorizontalAlignment(Element.ALIGN_LEFT);
				billsvalues.setWidthPercentage(100);
				billsvalues.setWidths(new float[]{15f,15f,15f,15f,15f,25f});
				
				PdfPCell billdate_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(billsDO.getBilldate()), font8));
				billdate_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				billdate_value.setBorderColor(BaseColor.GRAY);
				billsvalues.addCell(billdate_value);
				
				PdfPCell billno_value = new PdfPCell(new Paragraph(billsDO.getBillno(), font8));
				billno_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				billno_value.setBorderColor(BaseColor.GRAY);
				billno_value.setFixedHeight(15);
				billsvalues.addCell(billno_value);
	
				vendorlist = new VendorService().retriveById(billsDO.getVendorid());
				if(vendorlist.size() > 0 && vendorlist != null){
						PdfPCell vendorname_value = new PdfPCell(new Paragraph(vendorlist.get(0).getName(), font8));
						vendorname_value.setHorizontalAlignment(Element.ALIGN_LEFT);
						vendorname_value.setBorderColor(BaseColor.GRAY);
						billsvalues.addCell(vendorname_value);
				}
	
				PdfPCell paidon_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(billsDO.getPaidon()), font8));
				paidon_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				paidon_value.setBorderColor(BaseColor.GRAY);
				billsvalues.addCell(paidon_value);

				PdfPCell amount_value = new PdfPCell(new Paragraph(decimalformat.format(billsDO.getDueamount()), font8)); 
				amount_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
				amount_value.setBorderColor(BaseColor.GRAY);
				amount_value.setPaddingRight(5);
				billsvalues.addCell(amount_value);
				
				PdfPCell comments_value = new PdfPCell(new Paragraph(billsDO.getComments(), font8));
				comments_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				comments_value.setNoWrap(false);
				comments_value.setBorderColor(BaseColor.GRAY);
				comments_value.setPaddingRight(5);
				billsvalues.addCell(comments_value);
					
				document.add(billsvalues);
				
			}	
			
			document.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	} 
}
