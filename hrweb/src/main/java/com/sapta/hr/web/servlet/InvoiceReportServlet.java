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
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.domainobject.InvoiceDetailsDO;
import com.sapta.hr.domainobject.SaptaProfileDO;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.service.InvoiceDetailsService;
import com.sapta.hr.service.InvoiceService;
import com.sapta.hr.service.SaptaProfileService;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.InvoicePDFUtil;


@SuppressWarnings("serial")
@WebServlet("/invoicepdfreport")
public class InvoiceReportServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		List<InvoiceDO> invoicelist = null;
		List<InvoiceDetailsDO> invoicedetailslist = null;
		List<SaptaProfileDO> saptadetailslist = null;
		List<CustomerDO> customerlist = null;
		PdfPTable invoiceamountrow = null;
		PdfPTable invoicesizerow = null;
		PdfPTable horizontalrow = null;
		PdfPTable invoicenumtbl = null;
		PdfPTable billto = null;
		PdfPTable totaltbl = null;
		PdfPTable receiveddetailstable = null;
		PdfPTable receivedtbl = null;
		PdfPTable duedatetbl = null;
		PdfPTable servicetaxtable = null;
		PdfPTable subtotaltbl = null;
		PdfPTable grandtotal = null;
		PdfPTable writedetailstbl = null;
		PdfPTable writedetailscontenttbl = null;
		PdfPTable thankstbl = null;
		PdfPTable totallinetbl = null;
		PdfPTable headingline = null;
		
		NumberFormat decimalformat = NumberFormat.getInstance();
		decimalformat.setMinimumFractionDigits(2);
		Document document = new Document(PageSize.A4, 35, 35 ,45, 85);
		
	try {
			invoicelist = new InvoiceService().getFinancialYearInvoiceReport(CommonUtil.convertStringToDate(startDate), CommonUtil.convertStringToDate(endDate), 'i');
			BaseFont base = BaseFont.createFont("http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/font/Verdana.ttf", BaseFont.WINANSI, false);
			Font fontgry12 = new Font(base, 12, Font.BOLD, BaseColor.GRAY);
			Font fontgry10 = new Font(base, 10, Font.BOLD, BaseColor.GRAY);
			Font fontgry8 = new Font(base, 8, Font.BOLD, BaseColor.GRAY);
			Font fontgry6 = new Font(base, 6, Font.BOLD, BaseColor.GRAY);
	        Font font12 = new Font(base, 12, Font.BOLD, BaseColor.BLACK);
	        Font font14 = new Font(base, 14, Font.BOLD, BaseColor.BLACK);
	        Font fontblk12 = new Font(base, 12, Font.NORMAL, BaseColor.BLACK);
	        Font font10 = new Font(base, 10, Font.NORMAL, BaseColor.BLACK);
	        Font fontitalic10 = new Font(base, 10, Font.ITALIC, BaseColor.BLACK);
			Font font8 = new Font(base, 8, Font.NORMAL, BaseColor.BLACK);
			Font fontbold8 = new Font(base, 8, Font.BOLD, BaseColor.BLACK);
			Font font6 = new Font(base, 6, Font.NORMAL, BaseColor.BLACK);
			resp.setContentType("application/pdf");
			resp.setHeader("Content-Disposition","attachment; filename=\""+startDate+"_"+endDate+"_"+"Invoice_Report.pdf\"");
			
			PdfWriter writer = PdfWriter.getInstance(document, resp.getOutputStream());
			String imageUrl = "http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/images/logo.png";
			
			PdfPTable logo = new PdfPTable(1);
			logo.setWidthPercentage(100);
			Image image = Image.getInstance(imageUrl);
			image.scaleAbsolute(150f, 35f);
			PdfPCell cell = new PdfPCell(image);
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			cell.setVerticalAlignment(Element.ALIGN_TOP);
			cell.setPaddingTop(0);
			cell.setBorder(0);
			logo.addCell(cell);
			
			horizontalrow = new PdfPTable(1);
			horizontalrow.setWidthPercentage(100);
			horizontalrow.setSpacingBefore(70f);
			PdfPCell contenerowcell = new PdfPCell(new Paragraph("Invoice report between"+""+startDate+" and "+endDate, fontitalic10));
			contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenerowcell.setBorder(0);
			contenerowcell.setPaddingTop(-5);
			horizontalrow.addCell(contenerowcell);
			
			
			invoicesizerow = new PdfPTable(2);
			invoicesizerow.setWidthPercentage(100);
			invoicesizerow.setSpacingBefore(250f);
			
			
			invoicesizerow.setHorizontalAlignment(Element.ALIGN_CENTER);
			invoicesizerow.setWidthPercentage(100);
		
			PdfPCell invoicesizevalue= new PdfPCell(new Paragraph("No of Invoices:", fontblk12));
			invoicesizevalue.setHorizontalAlignment(Element.ALIGN_RIGHT);
			invoicesizevalue.setBorder(Rectangle.NO_BORDER);
			invoicesizerow.addCell(invoicesizevalue);
			
			PdfPCell invoicesize= new PdfPCell(new Paragraph(""+invoicelist.size(), font14));
			invoicesize.setHorizontalAlignment(Element.ALIGN_LEFT);
			invoicesize.setBorder(Rectangle.NO_BORDER);
			invoicesizerow.addCell(invoicesize);
			
			
			invoiceamountrow = new PdfPTable(2);
			invoiceamountrow.setWidthPercentage(100); 
			invoiceamountrow.setSpacingBefore(5f);
			double invoiceamount = 0;
			int servicetxa = 0;
			for(InvoiceDO invoicedo : invoicelist)
			{
				invoiceamount = invoiceamount + invoicedo.getReceivedamount(); 
			}
			PdfPCell invoicetotalamount = new PdfPCell(new Paragraph("Invoice Amount: ", fontblk12));
			invoicetotalamount.setHorizontalAlignment(Element.ALIGN_RIGHT);
			invoicetotalamount.setBorder(Rectangle.NO_BORDER);
			invoiceamountrow.addCell(invoicetotalamount);
			
			PdfPCell invoicetotalamountval= new PdfPCell(new Paragraph(""+decimalformat.format(invoiceamount), font14));
			invoicetotalamountval.setHorizontalAlignment(Element.ALIGN_LEFT);
			invoicetotalamountval.setBorder(Rectangle.NO_BORDER);
			invoiceamountrow.addCell(invoicetotalamountval);
			
			saptadetailslist = new SaptaProfileService().retriveList();
			
			PdfPTable tanandpantbl = new PdfPTable(1);
			
			
			tanandpantbl = new PdfPTable(2);
			tanandpantbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tanandpantbl.setWidthPercentage(25);
		
			PdfPCell tancell= new PdfPCell(new Paragraph("TAN :", font8));
			tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancell.setPaddingTop(20);
			tancell.setBorder(Rectangle.NO_BORDER);
			tanandpantbl.addCell(tancell);
			
			PdfPCell tancellval= new PdfPCell(new Paragraph(saptadetailslist.get(0).getTan(), fontbold8));
			tancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancellval.setPaddingTop(20);
			tancellval.setBorder(Rectangle.NO_BORDER);
			tanandpantbl.addCell(tancellval);
			
			PdfPTable pantbl = new PdfPTable(1);
			
			
			pantbl = new PdfPTable(2);
			pantbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
			pantbl.setWidthPercentage(25);
		
			PdfPCell pancell= new PdfPCell(new Paragraph("PAN :", font8));
			pancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			pancell.setBorder(Rectangle.NO_BORDER);
			pantbl.addCell(pancell);
			
			PdfPCell pancellval= new PdfPCell(new Paragraph(saptadetailslist.get(0).getPan(), fontbold8));
			pancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			pancellval.setBorder(Rectangle.NO_BORDER);
			pantbl.addCell(pancellval);
			
			document.open();
			document.add(logo);
			document.add(horizontalrow);
			document.add(invoicesizerow);
			document.add(invoiceamountrow);
			
			InvoicePDFUtil event = new InvoicePDFUtil(FooterUtil.getFooterDetails(req));
			writer.setPageEvent(event);
			
		
			for(InvoiceDO invoicelists : invoicelist){
				document.newPage();
			
				float[] rowcolumnWidths = {16f,4f,16f};
				headingline = new PdfPTable(rowcolumnWidths);
				headingline.setWidthPercentage(100);
				headingline.setSpacingBefore(25f);
				
				PdfPCell leftrowcell = new PdfPCell(new Paragraph("", fontbold8)); 
				leftrowcell.setHorizontalAlignment(Element.ALIGN_LEFT);
				leftrowcell.setBorder( Rectangle.TOP);
				leftrowcell.setBorderColor(BaseColor.GRAY);
				headingline.addCell(leftrowcell);
				
				PdfPCell contenerowcells = new PdfPCell(new Paragraph("INVOICE ", fontitalic10));
				contenerowcells.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenerowcells.setBorder(0);
				contenerowcells.setPaddingTop(-5);
				headingline.addCell(contenerowcells);
				
				PdfPCell rightrowcell = new PdfPCell(new Paragraph("", fontbold8)); 
				rightrowcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				rightrowcell.setBorder( Rectangle.TOP);
				rightrowcell.setBorderColor(BaseColor.GRAY);
				headingline.addCell(rightrowcell);
				
				
				
				
				 invoicenumtbl = new PdfPTable(2);
				 invoicenumtbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
				 invoicenumtbl.setWidthPercentage(35);
			
				PdfPCell invoicenumcell= new PdfPCell(new Paragraph("Invoice No : ", font8));
				invoicenumcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				invoicenumcell.setBorder(Rectangle.NO_BORDER);
				invoicenumcell.setPaddingTop(20);
				invoicenumcell.setPaddingBottom(15);
				invoicenumcell.setPaddingRight(0);
				invoicenumtbl.addCell(invoicenumcell);
				
				PdfPCell invoiceno= new PdfPCell(new Paragraph(invoicelists.getInvoiceno(), fontbold8));
				invoiceno.setHorizontalAlignment(Element.ALIGN_RIGHT);
				invoiceno.setBorder(Rectangle.NO_BORDER);
				invoiceno.setPaddingTop(20);
				invoiceno.setPaddingBottom(15);
				invoiceno.setPaddingRight(0);
				invoicenumtbl.addCell(invoiceno);
				
				billto = new PdfPTable(1);
				billto.setHorizontalAlignment(Element.ALIGN_LEFT);
				billto.setWidthPercentage(50);
					
				PdfPCell billtocell_1 = new PdfPCell(new Paragraph("Bill To", fontbold8)); 
				billtocell_1.setFixedHeight(15);
				billtocell_1.setHorizontalAlignment(Element.ALIGN_LEFT);
				billtocell_1.setBackgroundColor(new BaseColor(211,211,211));
				billtocell_1.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT | Rectangle.TOP | Rectangle.LEFT);
				billtocell_1.setBorderColorTop(BaseColor.GRAY);
				billtocell_1.setBorderColor(BaseColor.GRAY);
				billto.addCell(billtocell_1);
				customerlist = new CustomerService().retriveById(invoicelists.getCustomerid());
				if(customerlist.size()>0 && customerlist != null ){
					PdfPCell billtocell_2 = new PdfPCell(new Paragraph(customerlist.get(0).getName(),fontbold8)); 
					billtocell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
					billtocell_2.setBorderColor(BaseColor.GRAY);
					billtocell_2.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
					billtocell_2.setPaddingLeft(5);
					billtocell_2.setPaddingTop(5);
					billto.addCell(billtocell_2);
					billtocell_2 = new PdfPCell(new Paragraph(customerlist.get(0).getAddress(),font8));
					billtocell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
					billtocell_2.setBorderColor(BaseColor.GRAY);
					billtocell_2.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
					billtocell_2.setPaddingLeft(5);
					billto.addCell(billtocell_2);
					billtocell_2 = new PdfPCell(new Paragraph("Pin : "+customerlist.get(0).getPincode(),font8));
					billtocell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
					billtocell_2.setBorderColor(BaseColor.GRAY);
					billtocell_2.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
					billtocell_2.setPaddingLeft(5);
					billto.addCell(billtocell_2);
					String custEmail = customerlist.get(0).getEmail();
					if(custEmail != null && custEmail != "" ){
						custEmail = customerlist.get(0).getEmail();
					}else{
						custEmail = "";
					}
					
					billtocell_2 = new PdfPCell(new Paragraph("Email : "+custEmail,font8));
					billtocell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
					billtocell_2.setBorderColor(BaseColor.GRAY);
					billtocell_2.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
					billtocell_2.setPaddingLeft(5);
					billtocell_2.setPaddingBottom(5);
					billto.addCell(billtocell_2);
				}
				if(String.valueOf(invoicelists.getInvoicestatus()).equalsIgnoreCase("i")){
					receiveddetailstable = new PdfPTable(4);
					receiveddetailstable.setHorizontalAlignment(Element.ALIGN_LEFT);
					receiveddetailstable.setWidthPercentage(100);					
					receiveddetailstable.setSpacingBefore(50f);
					
					PdfPCell receiveddatecell = new PdfPCell(new Paragraph("Received Date", fontbold8)); 
					receiveddatecell.setFixedHeight(15);
					receiveddatecell.setHorizontalAlignment(Element.ALIGN_CENTER);
					receiveddatecell.setBackgroundColor(new BaseColor(211,211,211));
					receiveddatecell.setBorderColor(BaseColor.GRAY);
					receiveddetailstable.addCell(receiveddatecell);
					
					PdfPCell receivedamountcell = new PdfPCell(new Paragraph("Amount", fontbold8)); 
					receivedamountcell.setFixedHeight(15);
					receivedamountcell.setHorizontalAlignment(Element.ALIGN_CENTER);
					receivedamountcell.setBackgroundColor(new BaseColor(211,211,211));
					receivedamountcell.setBorderColor(BaseColor.GRAY);
					receiveddetailstable.addCell(receivedamountcell);
					
					PdfPCell receivedamounttypecell = new PdfPCell(new Paragraph("Amount Type", fontbold8)); 
					receivedamounttypecell.setFixedHeight(15);
					receivedamounttypecell.setHorizontalAlignment(Element.ALIGN_CENTER);
					receivedamounttypecell.setBackgroundColor(new BaseColor(211,211,211));
					receivedamounttypecell.setBorderColor(BaseColor.GRAY);
					receiveddetailstable.addCell(receivedamounttypecell);
					
					PdfPCell receivedcommentscell = new PdfPCell(new Paragraph("Comments", fontbold8)); 
					receivedcommentscell.setFixedHeight(15);
					receivedcommentscell.setHorizontalAlignment(Element.ALIGN_CENTER);
					receivedcommentscell.setBackgroundColor(new BaseColor(211,211,211));
					receivedcommentscell.setBorderColor(BaseColor.GRAY);
					receiveddetailstable.addCell(receivedcommentscell);
					
					PdfPCell receieveddatecellvalue = new PdfPCell(new Paragraph((CommonUtil.convertDateToStringWithOutTime(invoicelists.getReceiveddate())), font8)); 
					receieveddatecellvalue.setHorizontalAlignment(Element.ALIGN_CENTER);
					receieveddatecellvalue.setBorderColor(BaseColor.GRAY);
					receieveddatecellvalue.setFixedHeight(20);
					receieveddatecellvalue.setPaddingTop(5);
					receiveddetailstable.addCell(receieveddatecellvalue);
					
					PdfPCell receievedamountcellvalue = new PdfPCell(new Paragraph(decimalformat.format(invoicelists.getReceivedamount()), font8)); 
					receievedamountcellvalue.setHorizontalAlignment(Element.ALIGN_RIGHT);
					receievedamountcellvalue.setBorderColor(BaseColor.GRAY);
					receievedamountcellvalue.setFixedHeight(20);
					receievedamountcellvalue.setPaddingTop(5);
					receiveddetailstable.addCell(receievedamountcellvalue);
					
					String amountType = "";
					if(String.valueOf(invoicelists.getReceivedamounttype()).equalsIgnoreCase("inr")){
						amountType = "INR";
					}else if(String.valueOf(invoicelists.getReceivedamounttype()).equalsIgnoreCase("usd")){
						amountType = "USD";
					}else if(String.valueOf(invoicelists.getReceivedamounttype()).equalsIgnoreCase("eur")){
						amountType = "EUR";
					}else if(String.valueOf(invoicelists.getReceivedamounttype()).equalsIgnoreCase("gbp")){
						amountType = "GBP";
					}
					PdfPCell receievedamounttypecellvalue = new PdfPCell(new Paragraph(amountType, font8)); 
					receievedamounttypecellvalue.setHorizontalAlignment(Element.ALIGN_CENTER);
					receievedamounttypecellvalue.setBorderColor(BaseColor.GRAY);
					receievedamounttypecellvalue.setFixedHeight(20);
					receievedamounttypecellvalue.setPaddingTop(5);
					receiveddetailstable.addCell(receievedamounttypecellvalue);
	
					PdfPCell receievedcommentscellvalue = new PdfPCell(new Paragraph(invoicelists.getReceivedcomments(), font8)); 
					receievedcommentscellvalue.setHorizontalAlignment(Element.ALIGN_LEFT);
					receievedcommentscellvalue.setBorderColor(BaseColor.GRAY);
					receievedcommentscellvalue.setNoWrap(false);
					receievedcommentscellvalue.setPaddingTop(5);
					receiveddetailstable.addCell(receievedcommentscellvalue);
				}
			
				duedatetbl = new PdfPTable(3);
				duedatetbl.setHorizontalAlignment(Element.ALIGN_LEFT);
				duedatetbl.setSpacingBefore(50f);
				duedatetbl.setWidthPercentage(100);
				
				PdfPCell datecell = new PdfPCell(new Paragraph("Invoice Date", fontbold8)); 
				datecell.setFixedHeight(15);
				datecell.setHorizontalAlignment(Element.ALIGN_CENTER);
				datecell.setBackgroundColor(new BaseColor(211,211,211));
				datecell.setBorderColor(BaseColor.GRAY);
				duedatetbl.addCell(datecell);
				
				PdfPCell termscell= new PdfPCell(new Paragraph("Terms", fontbold8));
				termscell.setFixedHeight(15);
				termscell.setHorizontalAlignment(Element.ALIGN_CENTER);
				termscell.setBackgroundColor(new BaseColor(211,211,211));
				termscell.setBorderColor(BaseColor.GRAY);
				duedatetbl.addCell(termscell);
					
				PdfPCell duedatecell= new PdfPCell(new Paragraph("Due Date", fontbold8));
				duedatecell.setFixedHeight(15);
				duedatecell.setHorizontalAlignment(Element.ALIGN_CENTER);
				duedatecell.setBackgroundColor(new BaseColor(211,211,211));
				duedatecell.setBorderColor(BaseColor.GRAY);
				duedatetbl.addCell(duedatecell);

				PdfPCell datecell_value = new PdfPCell(new Paragraph((CommonUtil.convertDateToStringWithOutTime(invoicelists.getInvoicedate())), font8)); 
				datecell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				datecell_value.setBorderColor(BaseColor.GRAY);
				datecell_value.setFixedHeight(20);
				datecell_value.setPaddingTop(5);
				duedatetbl.addCell(datecell_value);
				
				PdfPCell termscell_value = new PdfPCell(new Paragraph("Due on date specified", font6)); 
				termscell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				termscell_value.setBorderColor(BaseColor.GRAY);
				termscell_value.setFixedHeight(20);
				termscell_value.setPaddingTop(5);
				duedatetbl.addCell(termscell_value);

				PdfPCell duedatecell_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime((invoicelists.getDuedate())), font8)); 
				duedatecell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				duedatecell_value.setBorderColor(BaseColor.GRAY);
				duedatecell_value.setFixedHeight(20);
				duedatecell_value.setPaddingTop(5);
				duedatetbl.addCell(duedatecell_value);
				
				if(String.valueOf(invoicelists.getTypeofinvoice()).equalsIgnoreCase("f")){
					float[] totlcolumnWidths = {74f,75f,74f,75f,85f};
					totaltbl = new PdfPTable(totlcolumnWidths);
				}else{
					float[] totlcolumnWidths = {74f,75f,74f,70f,75f,70f,85f};
					totaltbl = new PdfPTable(totlcolumnWidths);
				}
				/*float[] totlcolumnWidths = {74f,75f,74f,70f,75f,70f,85f};
				totaltbl = new PdfPTable(totlcolumnWidths);*/
				totaltbl.setHorizontalAlignment(Element.ALIGN_LEFT);
				totaltbl.setWidthPercentage(100);
				totaltbl.setSpacingBefore(50f);
				
				PdfPCell refnumcell = new PdfPCell(new Paragraph("Reference", fontbold8));
				refnumcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				refnumcell.setBackgroundColor(new BaseColor(211,211,211));
				refnumcell.setBorderColor(BaseColor.GRAY);
				refnumcell.setFixedHeight(15);
				totaltbl.addCell(refnumcell);
				
				PdfPCell fromcell = new PdfPCell(new Paragraph("From", fontbold8));
				fromcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				fromcell.setBackgroundColor(new BaseColor(211,211,211));
				fromcell.setBorderColor(BaseColor.GRAY);
				totaltbl.addCell(fromcell);
				
				PdfPCell tocell = new PdfPCell(new Paragraph("To", fontbold8));
				tocell.setHorizontalAlignment(Element.ALIGN_CENTER);
				tocell.setBackgroundColor(new BaseColor(211,211,211));
				tocell.setBorderColor(BaseColor.GRAY);
				totaltbl.addCell(tocell);

				if(String.valueOf(invoicelists.getTypeofinvoice()).equalsIgnoreCase("f")){
					/*PdfPCell totalhrscell = new PdfPCell(new Paragraph("Fixed Period", fontbold8));
					totalhrscell.setHorizontalAlignment(Element.ALIGN_CENTER);
					totalhrscell.setBackgroundColor(new BaseColor(211,211,211));
					totalhrscell.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(totalhrscell);
					
					PdfPCell ratecell = new PdfPCell(new Paragraph("Fixed Rate", fontbold8));
					ratecell.setHorizontalAlignment(Element.ALIGN_CENTER);
					ratecell.setBackgroundColor(new BaseColor(211,211,211));
					ratecell.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(ratecell);*/
				}else{
					String timeperiod = "";
					String perrateperiod = "";
					if(String.valueOf(invoicelists.getTypeofinvoice()).equalsIgnoreCase("h")){
						timeperiod = "Hours";
						perrateperiod = "Hour";
					}else if(String.valueOf(invoicelists.getTypeofinvoice()).equalsIgnoreCase("d")){
						timeperiod = "Days";
						perrateperiod = "Day";
					}else if(String.valueOf(invoicelists.getTypeofinvoice()).equalsIgnoreCase("w")){
						timeperiod = "Weeks";
						perrateperiod = "Week";
					}else if(String.valueOf(invoicelists.getTypeofinvoice()).equalsIgnoreCase("m")){
						timeperiod = "Months";
						perrateperiod = "Month";
					}
					
					PdfPCell totalhrscell = new PdfPCell(new Paragraph("Total "+timeperiod, fontbold8));
					totalhrscell.setHorizontalAlignment(Element.ALIGN_CENTER);
					totalhrscell.setBackgroundColor(new BaseColor(211,211,211));
					totalhrscell.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(totalhrscell);
					
					PdfPCell ratecell = new PdfPCell(new Paragraph("Rate/"+perrateperiod, fontbold8));
					ratecell.setHorizontalAlignment(Element.ALIGN_CENTER);
					ratecell.setBackgroundColor(new BaseColor(211,211,211));
					ratecell.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(ratecell);
					
				}
					
				String amounttype = "";
				
				if(String.valueOf(invoicelists.getAmounttype()).equalsIgnoreCase("inr")){
					amounttype = "INR";
				}else if(String.valueOf(invoicelists.getAmounttype()).equalsIgnoreCase("usd")){
					amounttype = "USD";
				}else if(String.valueOf(invoicelists.getAmounttype()).equalsIgnoreCase("eur")){
					amounttype = "EUR";
				}else if(String.valueOf(invoicelists.getAmounttype()).equalsIgnoreCase("gbp")){
					amounttype = "GBP";
				}
				PdfPCell totalcell = new PdfPCell(new Paragraph("Total ("+amounttype+")", fontbold8));
				totalcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				totalcell.setBackgroundColor(new BaseColor(211,211,211));
				totalcell.setBorderColor(BaseColor.GRAY);
				totaltbl.addCell(totalcell);
				
				PdfPCell netamtcell = new PdfPCell(new Paragraph("Net Amount ("+amounttype+")", fontbold8));
				netamtcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				netamtcell.setBackgroundColor(new BaseColor(211,211,211));
				netamtcell.setBorderColor(BaseColor.GRAY);
				totaltbl.addCell(netamtcell);
			
				invoicedetailslist = new InvoiceDetailsService().retriveByInvoiceNo(invoicelists.getInvoiceno());
					for(InvoiceDetailsDO invoiceDetailsDO : invoicedetailslist){
						
					PdfPCell refnumcell_value = new PdfPCell(new Paragraph(invoiceDetailsDO.getRefnumbername(), font8));
					refnumcell_value.setHorizontalAlignment(Element.ALIGN_LEFT);
					refnumcell_value.setBorderColor(BaseColor.GRAY);
					refnumcell_value.setNoWrap(false);
					totaltbl.addCell(refnumcell_value);
					
					PdfPCell fromcell_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(invoiceDetailsDO.getServicefrom()), font8));
					fromcell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
					fromcell_value.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(fromcell_value);
					
					PdfPCell tocell_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(invoiceDetailsDO.getServiceto()), font8));
					tocell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
					tocell_value.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(tocell_value);
					
					if(String.valueOf(invoicelists.getTypeofinvoice()).equalsIgnoreCase("f")){
						
					}else{
						if(invoiceDetailsDO.getTimeperiod() != 0){
							PdfPCell totalhrscell_value = new PdfPCell(new Paragraph(String.valueOf(invoiceDetailsDO.getTimeperiod()), font8));
							totalhrscell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
							totalhrscell_value.setBorderColor(BaseColor.GRAY);
							totaltbl.addCell(totalhrscell_value);
						} else{
							PdfPCell totalhrscell_value = new PdfPCell(new Paragraph("", font8));
							totalhrscell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
							totalhrscell_value.setBorderColor(BaseColor.GRAY);
							totaltbl.addCell(totalhrscell_value);
						}
					
						PdfPCell ratecell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(invoiceDetailsDO.getRateofperiod())), font8));
						ratecell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
						ratecell_value.setBorderColor(BaseColor.GRAY);
						totaltbl.addCell(ratecell_value);
					}
					PdfPCell totalcell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(invoiceDetailsDO.getDueamount())), font8));
					totalcell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
					totalcell_value.setBorderColor(BaseColor.GRAY);
					totalcell_value.setPaddingRight(5);
					totaltbl.addCell(totalcell_value);
					
					PdfPCell netamtcell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(invoiceDetailsDO.getDueamount())), font8));
					netamtcell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
					netamtcell_value.setBorderColor(BaseColor.GRAY);
					netamtcell_value.setPaddingRight(5);
					totaltbl.addCell(netamtcell_value);
				}
				if(String.valueOf(invoicelists.getAmounttype()).equalsIgnoreCase("inr")){
					double subtotalamount = invoicelists.getTotalamount() ;
					float[] servicetaxcolumn = {8f,1.5f};
					servicetaxtable = new PdfPTable(servicetaxcolumn);
					servicetaxtable.setWidthPercentage(100f);
					servicetaxtable.setSpacingBefore(10f);
					
					PdfPCell servicetaxcell = new PdfPCell(new Paragraph("Service Tax (15%)", fontbold8));
					servicetaxcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
					servicetaxcell.setBorder(0);
					servicetaxtable.addCell(servicetaxcell);
					
					PdfPCell servicetaxvalue = new PdfPCell(new Paragraph(decimalformat.format(invoicelists.getServicetax()), fontbold8));
					servicetaxvalue.setHorizontalAlignment(Element.ALIGN_RIGHT);
					servicetaxvalue.setBorder(0);
					servicetaxvalue.setPaddingRight(5);
					servicetaxtable.addCell(servicetaxvalue);
					
					float[] columnWidths = {8f,1.5f};
					subtotaltbl = new PdfPTable(columnWidths);
					subtotaltbl.setWidthPercentage(100f);
					subtotaltbl.setSpacingBefore(10f);
					
					PdfPCell subtotalcell = new PdfPCell(new Paragraph("Sub Total", fontbold8));
					subtotalcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
					subtotalcell.setBorder(0);
					subtotaltbl.addCell(subtotalcell);
					
					PdfPCell subtotalcell_value = new PdfPCell(new Paragraph(decimalformat.format(subtotalamount), fontbold8));
					subtotalcell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
					subtotalcell_value.setBorder(0);
					subtotalcell_value.setPaddingRight(5);
					subtotaltbl.addCell(subtotalcell_value);
					
					totallinetbl = new PdfPTable(1);
					totallinetbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
					totallinetbl.setWidthPercentage(25);
					totallinetbl.setSpacingBefore(15f);
					
					
					PdfPCell totallinecell = new PdfPCell(new Paragraph("",fontbold8));
					totallinecell.setHorizontalAlignment(Element.ALIGN_LEFT);
					totallinecell.setBorderColor(BaseColor.GRAY);
					totallinecell.setBorder(Rectangle.TOP);
					totallinecell.setPaddingRight(5);
					totallinetbl.addCell(totallinecell);
					
				}
					
				float[] totalcolumnWidths = {8f,1.5f};
				grandtotal = new PdfPTable(totalcolumnWidths);
				grandtotal.setHorizontalAlignment(Element.ALIGN_LEFT);
				grandtotal.setWidthPercentage(100);
				grandtotal.setSpacingBefore(10f);
				
				PdfPCell grandtotalcell = new PdfPCell(new Paragraph("Total", fontbold8));
				grandtotalcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				grandtotalcell.setBorder(0);
				grandtotal.addCell(grandtotalcell);
				double gtotal = 0;
				if(invoicelists.getServicetax() != null  ){
					 gtotal = invoicelists.getTotalamount() + invoicelists.getServicetax();
				}else{
					 gtotal = invoicelists.getTotalamount();
				}
				PdfPCell grandtotalcell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(gtotal)), fontbold8));
				grandtotalcell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
				grandtotalcell_value.setBorder(0);
				grandtotalcell_value.setPaddingRight(5);
				grandtotal.addCell(grandtotalcell_value);
				
        
		        document.open();
				document.add(logo);
				document.add(tanandpantbl);
				document.add(pantbl);
				document.add(headingline);
				document.add(invoicenumtbl);
				document.add(billto);
				document.add(receiveddetailstable);
		
				document.add(duedatetbl);
				document.add(totaltbl);
				if(String.valueOf(invoicelists.getAmounttype()).equalsIgnoreCase("inr")){
					
					document.add(subtotaltbl);
					document.add(servicetaxtable);
					document.add(totallinetbl);
				}
				document.add(grandtotal);
				
		}
		document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 

}
