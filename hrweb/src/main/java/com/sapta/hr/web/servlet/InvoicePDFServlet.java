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
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.InvoicePDFUtil;


@SuppressWarnings("serial")
@WebServlet("/invoicepdf")
public class InvoicePDFServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings({ "unused"})
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		String invoiceno = req.getParameter("invoicenum");
		List<InvoiceDO> invoicelist = null;
		List<InvoiceDetailsDO> invoicedetailslist = null;
		List<SaptaProfileDO> saptadetailslist = null;
		List<CustomerDO> customerlist = null;
		
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
		PdfPTable companydetailstbl = null;
		PdfPTable companydetailscontenttbl = null;
		PdfPTable thankstbl = null;
		PdfPTable totallinetbl = null;
		
		NumberFormat decimalformat = NumberFormat.getInstance();
		decimalformat.setMinimumFractionDigits(2);
		
	try {
		Document document = new Document(PageSize.A4, 35, 35 ,45, 85);
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
		resp.setHeader("Content-Disposition","attachment; filename=\"invoice.pdf\"");
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
		
		PdfPTable tanandpantbl = new PdfPTable(1);
		PdfPTable pantbl = new PdfPTable(1);
		saptadetailslist = new SaptaProfileService().retriveList();
		for(SaptaProfileDO saptaDetailsDO : saptadetailslist){
			tanandpantbl = new PdfPTable(2);
			tanandpantbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tanandpantbl.setWidthPercentage(25);
		
			PdfPCell tancell= new PdfPCell(new Paragraph("", font8));
			tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancell.setPaddingTop(20);
			tancell.setBorder(Rectangle.NO_BORDER);
			tanandpantbl.addCell(tancell);
			
			PdfPCell tancellval= new PdfPCell(new Paragraph("", fontbold8));
			tancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancellval.setPaddingTop(20);
			tancellval.setBorder(Rectangle.NO_BORDER);
			tanandpantbl.addCell(tancellval);
			
			//pantbl = new PdfPTable(1);
			
			
			pantbl = new PdfPTable(2);
			pantbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
			pantbl.setWidthPercentage(25);
		
			PdfPCell pancell= new PdfPCell(new Paragraph("", font8));
			pancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			pancell.setBorder(Rectangle.NO_BORDER);
			pantbl.addCell(pancell);
			
			PdfPCell pancellval= new PdfPCell(new Paragraph("", fontbold8));
			pancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			pancellval.setBorder(Rectangle.NO_BORDER);
			pantbl.addCell(pancellval);
			
			
			
			/*PdfPCell tancell = new PdfPCell(new Paragraph("TAN - "+saptaDetailsDO.getTan(),font8)); 
			tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancell.setPaddingTop(15);
			tancell.setPaddingBottom(5);
			tancell.setPaddingRight(0);
			tancell.setPaddingRight(0);
			tancell.setBorder(0);
			tanandpantbl.addCell(tancell);
			
			PdfPCell pancell = new PdfPCell(new Paragraph("PAN - "+saptaDetailsDO.getPan(),font8)); 
			pancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			pancell.setPaddingTop(0);
			pancell.setPaddingBottom(5);
			pancell.setPaddingRight(0);
			pancell.setBorder(0);
			tanandpantbl.addCell(pancell);*/
		}
		
		float[] rowcolumnWidths = {16f,4f,16f};
		horizontalrow = new PdfPTable(rowcolumnWidths);
		horizontalrow.setWidthPercentage(100);
		horizontalrow.setSpacingBefore(25f);
		
		PdfPCell leftrowcell = new PdfPCell(new Paragraph("", fontbold8)); 
		leftrowcell.setHorizontalAlignment(Element.ALIGN_LEFT);
		leftrowcell.setBorder( Rectangle.TOP);
		leftrowcell.setBorderColor(BaseColor.GRAY);
		horizontalrow.addCell(leftrowcell);
		invoicelist = new InvoiceService().retriveByInvoiceNo(invoiceno);
		
		PdfPCell contenerowcell = new PdfPCell(new Paragraph("INVOICE", fontitalic10));
		contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
		contenerowcell.setBorder(0);
		contenerowcell.setPaddingTop(-5);
		horizontalrow.addCell(contenerowcell);
		
		PdfPCell rightrowcell = new PdfPCell(new Paragraph("", fontbold8)); 
		rightrowcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		rightrowcell.setBorder( Rectangle.TOP);
		rightrowcell.setBorderColor(BaseColor.GRAY);
		horizontalrow.addCell(rightrowcell);
			
		invoicenumtbl = new PdfPTable(1);
		invoicenumtbl.setWidthPercentage(100);
		invoicenumtbl.setSpacingBefore(0f);
			
		if(invoicelist.size() != 0){
			
			for(InvoiceDO invoice : invoicelist){
				 invoicenumtbl = new PdfPTable(2);
				 invoicenumtbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
				 invoicenumtbl.setWidthPercentage(30);
			
				PdfPCell invoicenumcell= new PdfPCell(new Paragraph("Invoice No : ", font8));
				invoicenumcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				invoicenumcell.setBorder(Rectangle.NO_BORDER);
				invoicenumcell.setPaddingTop(15);
				invoicenumcell.setPaddingBottom(15);
				invoicenumcell.setPaddingRight(0);
				invoicenumtbl.addCell(invoicenumcell);
				
				PdfPCell invoicenumber= new PdfPCell(new Paragraph(invoice.getInvoiceno(), fontbold8));
				invoicenumber.setHorizontalAlignment(Element.ALIGN_RIGHT);
				invoicenumber.setBorder(Rectangle.NO_BORDER);
				invoicenumber.setPaddingTop(15);
				invoicenumber.setPaddingBottom(15);
				invoicenumber.setPaddingRight(0);
				invoicenumtbl.addCell(invoicenumber);
					
				/*invoicenumtbl = new PdfPTable(1);
				invoicenumtbl.setWidthPercentage(100);
				invoicenumtbl.setSpacingBefore(10f);
				
				PdfPCell invoicenumcell = new PdfPCell(new Paragraph("Invoice No : "+invoice.getInvoiceno(), fontbold8)); 
				invoicenumcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				invoicenumcell.setBorder(0);
				invoicenumcell.setPaddingTop(20);
				invoicenumcell.setPaddingBottom(15);
				invoicenumcell.setPaddingRight(0);
				invoicenumtbl.setWidthPercentage(100);
				invoicenumtbl.addCell(invoicenumcell);*/
				
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
				customerlist = new CustomerService().retrive();
				for(CustomerDO customerDO : customerlist){
					if(String.valueOf(invoice.getCustomerid()).equalsIgnoreCase(String.valueOf(customerDO.getId()))){
						PdfPCell billtocell_2 = new PdfPCell(new Paragraph(customerDO.getName(),fontbold8)); 
						billtocell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
						billtocell_2.setBorderColor(BaseColor.GRAY);
						billtocell_2.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
						billtocell_2.setPaddingLeft(5);
						billtocell_2.setPaddingTop(5);
						billto.addCell(billtocell_2);
						billtocell_2 = new PdfPCell(new Paragraph(customerDO.getAddress(),font8));
						billtocell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
						billtocell_2.setBorderColor(BaseColor.GRAY);
						billtocell_2.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
						billtocell_2.setPaddingLeft(5);
						billto.addCell(billtocell_2);
						billtocell_2 = new PdfPCell(new Paragraph("Pin : "+customerDO.getPincode(),font8));
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
				}
				/*if(String.valueOf(invoice.getInvoicestatus()).equalsIgnoreCase("i")){
					float[] rowcolumn = {16f,4f,16f,100f};
					receiveddetailstable = new PdfPTable(rowcolumn);
					receiveddetailstable = new PdfPTable(4);
					receiveddetailstable.setHorizontalAlignment(Element.ALIGN_LEFT);
					receiveddetailstable.setWidthPercentage(100);					
					receiveddetailstable.setSpacingBefore(50f);
					receiveddetailstable.setExtendLastRow(true, false);;
					
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
					receivedcommentscell.setNoWrap(false);
					receivedcommentscell.setBackgroundColor(new BaseColor(211,211,211));
					receivedcommentscell.setBorderColor(BaseColor.GRAY);
					receivedcommentscell.setNoWrap(false);
					receiveddetailstable.addCell(receivedcommentscell);
					
					
					PdfPCell receieveddatecellvalue = new PdfPCell(new Paragraph((CommonUtil.convertDateToStringWithOutTime(invoice.getReceiveddate())), font8)); 
					receieveddatecellvalue.setHorizontalAlignment(Element.ALIGN_CENTER);
					receieveddatecellvalue.setBorderColor(BaseColor.GRAY);
					receieveddatecellvalue.setFixedHeight(20);
					receieveddatecellvalue.setPaddingTop(5);
					receiveddetailstable.addCell(receieveddatecellvalue);
					
					PdfPCell receievedamountcellvalue = new PdfPCell(new Paragraph(decimalformat.format(invoice.getReceivedamount()), font8)); 
					receievedamountcellvalue.setHorizontalAlignment(Element.ALIGN_RIGHT);
					receievedamountcellvalue.setBorderColor(BaseColor.GRAY);
					receievedamountcellvalue.setFixedHeight(20);
					receievedamountcellvalue.setPaddingTop(5);
					receiveddetailstable.addCell(receievedamountcellvalue);
					
					String amountType = "";
					if(String.valueOf(invoice.getReceivedamounttype()).equalsIgnoreCase("inr")){
						amountType = CommonConstants.INR;
					}else if(String.valueOf(invoice.getReceivedamounttype()).equalsIgnoreCase("usd")){
						amountType = CommonConstants.USD;
					}else if(String.valueOf(invoice.getReceivedamounttype()).equalsIgnoreCase("eur")){
						amountType = CommonConstants.EUR;
					}else if(String.valueOf(invoice.getReceivedamounttype()).equalsIgnoreCase("gbp")){
						amountType = CommonConstants.GBP;
					}
					PdfPCell receievedamounttypecellvalue = new PdfPCell(new Paragraph(amountType, font8)); 
					receievedamounttypecellvalue.setHorizontalAlignment(Element.ALIGN_CENTER);
					receievedamounttypecellvalue.setBorderColor(BaseColor.GRAY);
					receievedamounttypecellvalue.setFixedHeight(20);
					receievedamounttypecellvalue.setPaddingTop(5);
					receiveddetailstable.addCell(receievedamounttypecellvalue);
					
					PdfPCell receievedcommentscellvalue = new PdfPCell(new Paragraph(invoice.getReceivedcomments(), font8));
					cell = new PdfPCell(new Paragraph("blah"));
				    table.addCell("wrap");
				    cell.setNoWrap(false);
					receievedcommentscellvalue.setHorizontalAlignment(Element.ALIGN_LEFT);
					receievedcommentscellvalue.setBorderColor(BaseColor.GRAY);
					
					//receievedcommentscellvalue.setFixedHeight(20);
					receievedcommentscellvalue.setPaddingTop(5);
					//receievedcommentscellvalue.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
					//receievedcommentscellvalue.setRunDirection(PdfWriter.);
					receievedcommentscellvalue.setNoWrap(false);
					receiveddetailstable.addCell(receievedcommentscellvalue);
					
				}*/
					
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
				
				PdfPCell datecell_value = new PdfPCell(new Paragraph((CommonUtil.convertDateToStringWithOutTimeInvoice(invoice.getInvoicedate())), font8)); 
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
					
				PdfPCell duedatecell_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTimeInvoice((invoice.getDuedate())), font8)); 
				duedatecell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				duedatecell_value.setBorderColor(BaseColor.GRAY);
				duedatecell_value.setFixedHeight(20);
				duedatecell_value.setPaddingTop(5);
				duedatetbl.addCell(duedatecell_value);
				
				if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("f")){
					float[] totlcolumnWidths = {74f,75f,74f,70f,85f};
					totaltbl = new PdfPTable(totlcolumnWidths);
				}else if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("d")){
					float[] totlcolumnWidths = {74f,75f,74f,70f,75f,85f};
					totaltbl = new PdfPTable(totlcolumnWidths);
				}else{
					float[] totlcolumnWidths = {74f,75f,74f,70f,75f,75f,85f};
					totaltbl = new PdfPTable(totlcolumnWidths);
				}
				//totaltbl = new PdfPTable(totlcolumnWidths);
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
				fromcell.setFixedHeight(15);
				totaltbl.addCell(fromcell);
				
				PdfPCell tocell = new PdfPCell(new Paragraph("To", fontbold8));
				tocell.setHorizontalAlignment(Element.ALIGN_CENTER);
				tocell.setBackgroundColor(new BaseColor(211,211,211));
				tocell.setBorderColor(BaseColor.GRAY);
				tocell.setFixedHeight(15);
				totaltbl.addCell(tocell);
					
				if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("f")){
					/*PdfPCell totalhrscell = new PdfPCell(new Paragraph("Fixed Period", fontbold8));
					totalhrscell.setHorizontalAlignment(Element.ALIGN_CENTER);
					totalhrscell.setBackgroundColor(new BaseColor(211,211,211));
					totalhrscell.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(totalhrscell);*/
					
					/*PdfPCell ratecell = new PdfPCell(new Paragraph("Fixed Rate", fontbold8));
					ratecell.setHorizontalAlignment(Element.ALIGN_CENTER);
					ratecell.setBackgroundColor(new BaseColor(211,211,211));
					ratecell.setBorderColor(BaseColor.GRAY);
					totaltbl.addCell(ratecell);*/
					String timeperiod = "";
					timeperiod = "Days";
					
					PdfPCell totalhrscell = new PdfPCell(new Paragraph("Total "+timeperiod, fontbold8));
					totalhrscell.setHorizontalAlignment(Element.ALIGN_CENTER);
					totalhrscell.setBackgroundColor(new BaseColor(211,211,211));
					totalhrscell.setBorderColor(BaseColor.GRAY);
					totalhrscell.setFixedHeight(15);
					totaltbl.addCell(totalhrscell);
				}else{
					
					PdfPCell numberofdays = new PdfPCell(new Paragraph("Total Days", fontbold8));
					numberofdays.setHorizontalAlignment(Element.ALIGN_CENTER);
					numberofdays.setBackgroundColor(new BaseColor(211,211,211));
					numberofdays.setBorderColor(BaseColor.GRAY);
					numberofdays.setFixedHeight(15);
					totaltbl.addCell(numberofdays);
					
					String timeperiod = "";
					String perrateperiod = "";
					if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("h")){
						timeperiod = "Hours";
						perrateperiod = "Hour";
					}else if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("d")){
						timeperiod = "Days";
						perrateperiod = "Day";
					}else if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("w")){
						timeperiod = "Weeks";
						perrateperiod = "Week";
					}else if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("m")){
						timeperiod = "Months";
						perrateperiod = "Month";
					}
					if(!String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("d")){
						PdfPCell totalhrscell = new PdfPCell(new Paragraph("Total "+timeperiod, fontbold8));
						totalhrscell.setHorizontalAlignment(Element.ALIGN_CENTER);
						totalhrscell.setBackgroundColor(new BaseColor(211,211,211));
						totalhrscell.setBorderColor(BaseColor.GRAY);
						totalhrscell.setFixedHeight(15);
						totaltbl.addCell(totalhrscell);
					}
					PdfPCell ratecell = new PdfPCell(new Paragraph("Rate/"+perrateperiod, fontbold8));
					ratecell.setHorizontalAlignment(Element.ALIGN_CENTER);
					ratecell.setBackgroundColor(new BaseColor(211,211,211));
					ratecell.setBorderColor(BaseColor.GRAY);
					ratecell.setFixedHeight(15);
					totaltbl.addCell(ratecell);
					
				}
					
				String amounttype = "";
				if(String.valueOf(invoice.getAmounttype()).equalsIgnoreCase("inr")){
					amounttype = CommonConstants.INR;
				}else if(String.valueOf(invoice.getAmounttype()).equalsIgnoreCase("usd")){
					amounttype = CommonConstants.USD;
				}else if(String.valueOf(invoice.getAmounttype()).equalsIgnoreCase("eur")){
					amounttype = CommonConstants.EUR;
				}else if(String.valueOf(invoice.getAmounttype()).equalsIgnoreCase("gbp")){
					amounttype = CommonConstants.GBP;
				}
				/*PdfPCell totalcell = new PdfPCell(new Paragraph("Total ("+amounttype+")", fontbold8));
				totalcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				totalcell.setBackgroundColor(new BaseColor(211,211,211));
				totalcell.setBorderColor(BaseColor.GRAY);
				totalcell.setFixedHeight(15);
				totaltbl.addCell(totalcell);*/
				
				PdfPCell netamtcell = new PdfPCell(new Paragraph("Net Amount ("+amounttype+")", fontbold8));
				netamtcell.setHorizontalAlignment(Element.ALIGN_CENTER);
				netamtcell.setBackgroundColor(new BaseColor(211,211,211));
				netamtcell.setBorderColor(BaseColor.GRAY);
				netamtcell.setFixedHeight(15);
				totaltbl.addCell(netamtcell);
				
				invoicedetailslist = new InvoiceDetailsService().retriveByInvoiceNo(invoiceno);
					
				for(InvoiceDetailsDO invoiceDetailsDO : invoicedetailslist){
					PdfPCell refnumcell_value = new PdfPCell(new Paragraph(invoiceDetailsDO.getRefnumbername(), font8));
					refnumcell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
					refnumcell_value.setBorderColor(BaseColor.GRAY);
					refnumcell_value.setNoWrap(false);
					refnumcell.setFixedHeight(20);
					refnumcell.setPaddingTop(5);
					totaltbl.addCell(refnumcell_value);
					
					PdfPCell fromcell_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTimeInvoice(invoiceDetailsDO.getServicefrom()), font8));
					fromcell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
					fromcell_value.setBorderColor(BaseColor.GRAY);
					fromcell_value.setFixedHeight(20);
					fromcell_value.setPaddingTop(5);
					totaltbl.addCell(fromcell_value);
					
					PdfPCell tocell_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTimeInvoice(invoiceDetailsDO.getServiceto()), font8));
					tocell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
					tocell_value.setBorderColor(BaseColor.GRAY);
					tocell_value.setFixedHeight(20);
					tocell_value.setPaddingTop(5);
					totaltbl.addCell(tocell_value);
					
					if(String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("f")){
						if(invoiceDetailsDO.getNoofdays() != 0){
							PdfPCell totalhrscell_value = new PdfPCell(new Paragraph(String.valueOf(invoiceDetailsDO.getNoofdays()), font8));
							totalhrscell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
							totalhrscell_value.setBorderColor(BaseColor.GRAY);
							totalhrscell_value.setFixedHeight(20);
							totalhrscell_value.setPaddingTop(5);
							totaltbl.addCell(totalhrscell_value);
						} else{
							PdfPCell totalhrscell_value = new PdfPCell(new Paragraph("", font8));
							totalhrscell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
							totalhrscell_value.setBorderColor(BaseColor.GRAY);
							totalhrscell_value.setFixedHeight(20);
							totalhrscell_value.setPaddingTop(5);
							totaltbl.addCell(totalhrscell_value);
						}
					}else{
						if(!String.valueOf(invoice.getTypeofinvoice()).equalsIgnoreCase("d")){
							PdfPCell noofdays_value = new PdfPCell(new Paragraph(String.valueOf(invoiceDetailsDO.getNoofdays()), font8));
							noofdays_value.setHorizontalAlignment(Element.ALIGN_CENTER);
							noofdays_value.setBorderColor(BaseColor.GRAY);
							noofdays_value.setFixedHeight(20);
							noofdays_value.setPaddingTop(5);
							totaltbl.addCell(noofdays_value);
						}
						if(invoiceDetailsDO.getTimeperiod() != 0){
							PdfPCell totalhrscell_value = new PdfPCell(new Paragraph(String.valueOf(invoiceDetailsDO.getTimeperiod()), font8));
							totalhrscell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
							totalhrscell_value.setBorderColor(BaseColor.GRAY);
							totalhrscell_value.setFixedHeight(20);
							totalhrscell_value.setPaddingTop(5);
							totaltbl.addCell(totalhrscell_value);
						} else{
							PdfPCell totalhrscell_value = new PdfPCell(new Paragraph("", font8));
							totalhrscell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
							totalhrscell_value.setBorderColor(BaseColor.GRAY);
							totalhrscell_value.setFixedHeight(20);
							totalhrscell_value.setPaddingTop(5);
							totaltbl.addCell(totalhrscell_value);
						}
					
						PdfPCell ratecell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(invoiceDetailsDO.getRateofperiod())), font8));
						ratecell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
						ratecell_value.setBorderColor(BaseColor.GRAY);
						ratecell_value.setFixedHeight(20);
						ratecell_value.setPaddingRight(5);
						ratecell_value.setPaddingTop(5);
						totaltbl.addCell(ratecell_value);
					}
				/*	PdfPCell totalcell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(invoiceDetailsDO.getDueamount())), font8));
					totalcell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
					totalcell_value.setBorderColor(BaseColor.GRAY);
					totalcell_value.setPaddingRight(5);
					totalcell_value.setFixedHeight(20);
					totalcell_value.setPaddingTop(5);
					totaltbl.addCell(totalcell_value);*/
					
					PdfPCell netamtcell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(invoiceDetailsDO.getDueamount())), font8));
					netamtcell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
					netamtcell_value.setBorderColor(BaseColor.GRAY);
					netamtcell_value.setPaddingRight(5);
					netamtcell_value.setFixedHeight(20);
					netamtcell_value.setPaddingTop(5);
					totaltbl.addCell(netamtcell_value);
				}
				if(String.valueOf(invoice.getAmounttype()).equalsIgnoreCase("inr")){
				//	double subtotalamount = invoice.getTotalamount() - invoice.getServicetax();
					float[] servicetaxcolumn = {8f,1.5f};
					servicetaxtable = new PdfPTable(servicetaxcolumn);
					servicetaxtable.setWidthPercentage(100f);
					servicetaxtable.setSpacingBefore(10f);
					
					PdfPCell servicetaxcell = new PdfPCell(new Paragraph("Service Tax ("+invoice.getServicetaxper()+"%)", fontbold8));
					servicetaxcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
					servicetaxcell.setBorder(0);
					servicetaxtable.addCell(servicetaxcell);
					
					PdfPCell servicetaxvalue = new PdfPCell(new Paragraph(decimalformat.format(invoice.getServicetax()), fontbold8));
					servicetaxvalue.setHorizontalAlignment(Element.ALIGN_RIGHT);
					servicetaxvalue.setBorder(0);
					servicetaxvalue.setPaddingRight(5);
					servicetaxtable.addCell(servicetaxvalue);
					
				}
				
				float[] columnWidths = {8f,1.5f};
				subtotaltbl = new PdfPTable(columnWidths);
				subtotaltbl.setWidthPercentage(100f);
				subtotaltbl.setSpacingBefore(10f);
				
				PdfPCell subtotalcell = new PdfPCell(new Paragraph("Sub Total("+amounttype+")", fontbold8));
				subtotalcell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				subtotalcell.setBorder(0);
				subtotaltbl.addCell(subtotalcell);
				
				PdfPCell subtotalcell_value = new PdfPCell(new Paragraph(decimalformat.format( invoice.getTotalamount()), fontbold8));
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
				if(invoice.getServicetax() != null  ){
					 gtotal = invoice.getTotalamount() + invoice.getServicetax();
				}else{
					 gtotal = invoice.getTotalamount();
				}
				
				PdfPCell grandtotalcell_value = new PdfPCell(new Paragraph(String.valueOf(decimalformat.format(gtotal)), fontbold8));
				grandtotalcell_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
				grandtotalcell_value.setBorder(0);
				grandtotalcell_value.setPaddingRight(5);
				grandtotal.addCell(grandtotalcell_value);
			}
		}
		
		companydetailstbl = new PdfPTable(1);
		companydetailstbl.setWidthPercentage(100);
		companydetailstbl.setSpacingBefore(15f);
		
		PdfPCell companydetailstblcell = new PdfPCell(new Paragraph("Company details",font10));
		companydetailstblcell.setHorizontalAlignment(Element.ALIGN_LEFT);
		companydetailstblcell.setBorder(0);
		companydetailstblcell.setPaddingTop(10);
		companydetailstbl.addCell(companydetailstblcell);
		
		float[] columnWidth = {1.5f,0.2f,6f};
		companydetailscontenttbl = new PdfPTable(columnWidth);
		companydetailscontenttbl.setHorizontalAlignment(Element.ALIGN_LEFT);
		companydetailscontenttbl.setWidthPercentage(100);
		companydetailscontenttbl.setSpacingBefore(25f);
		
		
		for(SaptaProfileDO saptaDetailsDO : saptadetailslist){
			/*tanandpantbl = new PdfPTable(2);
			tanandpantbl.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tanandpantbl.setWidthPercentage(25);*/
		
			PdfPCell tancell= new PdfPCell(new Paragraph("TAN", font8));
			tancell.setBorder(0);
			tancell.setPaddingTop(5);
			//tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			/*tancell.setPaddingTop(20);
			tancell.setBorder(Rectangle.NO_BORDER);*/
			companydetailscontenttbl.addCell(tancell);
			
			PdfPCell tancoloncell_1 = new PdfPCell(new Paragraph(":",font8));
			tancoloncell_1.setBorder(0);
			tancoloncell_1.setHorizontalAlignment(Element.ALIGN_LEFT);
			tancoloncell_1.setPaddingTop(5);
			tancoloncell_1.setPaddingLeft(0);
			companydetailscontenttbl.addCell(tancoloncell_1);
			
			PdfPCell tancellval= new PdfPCell(new Paragraph(saptaDetailsDO.getTan(), font8));
			/*tancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancellval.setPaddingTop(20);
			tancellval.setBorder(Rectangle.NO_BORDER);*/
			tancellval.setBorder(0);
			tancellval.setHorizontalAlignment(Element.ALIGN_LEFT);
			tancellval.setPaddingTop(5);
			tancellval.setPaddingLeft(0);
			companydetailscontenttbl.addCell(tancellval);
			
			
			PdfPCell pancell= new PdfPCell(new Paragraph("PAN", font8));
			pancell.setBorder(0);
			pancell.setPaddingTop(5);
			//tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			/*tancell.setPaddingTop(20);
			tancell.setBorder(Rectangle.NO_BORDER);*/
			companydetailscontenttbl.addCell(pancell);
			
			PdfPCell pancoloncell_1 = new PdfPCell(new Paragraph(":",font8));
			pancoloncell_1.setBorder(0);
			pancoloncell_1.setHorizontalAlignment(Element.ALIGN_LEFT);
			pancoloncell_1.setPaddingTop(5);
			pancoloncell_1.setPaddingLeft(0);
			companydetailscontenttbl.addCell(pancoloncell_1);
			
			PdfPCell pancellval= new PdfPCell(new Paragraph(saptaDetailsDO.getPan(), font8));
			/*tancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancellval.setPaddingTop(20);
			tancellval.setBorder(Rectangle.NO_BORDER);*/
			pancellval.setBorder(0);
			pancellval.setHorizontalAlignment(Element.ALIGN_LEFT);
			pancellval.setPaddingTop(5);
			pancellval.setPaddingLeft(0);
			companydetailscontenttbl.addCell(pancellval);
			
			PdfPCell cincell= new PdfPCell(new Paragraph("CIN", font8));
			cincell.setBorder(0);
			cincell.setPaddingTop(5);
			//tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			/*tancell.setPaddingTop(20);
			tancell.setBorder(Rectangle.NO_BORDER);*/
			companydetailscontenttbl.addCell(cincell);
			
			PdfPCell cincoloncell_1 = new PdfPCell(new Paragraph(":",font8));
			cincoloncell_1.setBorder(0);
			cincoloncell_1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cincoloncell_1.setPaddingTop(5);
			cincoloncell_1.setPaddingLeft(0);
			companydetailscontenttbl.addCell(cincoloncell_1);
			
			PdfPCell cincellval= new PdfPCell(new Paragraph(saptaDetailsDO.getCin(), font8));
			/*tancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancellval.setPaddingTop(20);
			tancellval.setBorder(Rectangle.NO_BORDER);*/
			cincellval.setBorder(0);
			cincellval.setHorizontalAlignment(Element.ALIGN_LEFT);
			cincellval.setPaddingTop(5);
			cincellval.setPaddingLeft(0);
			companydetailscontenttbl.addCell(cincellval);
			
			PdfPCell stcell= new PdfPCell(new Paragraph("ST", font8));
			stcell.setBorder(0);
			stcell.setPaddingTop(5);
			//tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			/*tancell.setPaddingTop(20);
			tancell.setBorder(Rectangle.NO_BORDER);*/
			companydetailscontenttbl.addCell(stcell);
			
			PdfPCell stcoloncell_1 = new PdfPCell(new Paragraph(":",font8));
			stcoloncell_1.setBorder(0);
			stcoloncell_1.setHorizontalAlignment(Element.ALIGN_LEFT);
			stcoloncell_1.setPaddingTop(5);
			stcoloncell_1.setPaddingLeft(0);
			companydetailscontenttbl.addCell(stcoloncell_1);
			
			PdfPCell stcellval= new PdfPCell(new Paragraph(saptaDetailsDO.getSt(), font8));
			/*tancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancellval.setPaddingTop(20);
			tancellval.setBorder(Rectangle.NO_BORDER);*/
			stcellval.setBorder(0);
			stcellval.setHorizontalAlignment(Element.ALIGN_LEFT);
			stcellval.setPaddingTop(5);
			stcellval.setPaddingLeft(0);
			companydetailscontenttbl.addCell(stcellval);
			
			PdfPCell stcell_1= new PdfPCell(new Paragraph("", font8));
			stcell_1.setBorder(0);
			stcell_1.setPaddingTop(5);
			//tancell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			/*tancell.setPaddingTop(20);
			tancell.setBorder(Rectangle.NO_BORDER);*/
			companydetailscontenttbl.addCell(stcell_1);
			
			PdfPCell stcoloncell_2 = new PdfPCell(new Paragraph("",font8));
			stcoloncell_2.setBorder(0);
			stcoloncell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
			stcoloncell_2.setPaddingTop(5);
			stcoloncell_2.setPaddingLeft(0);
			companydetailscontenttbl.addCell(stcoloncell_2);
			
			PdfPCell stcellval_1= new PdfPCell(new Paragraph("", font8));
			/*tancellval.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tancellval.setPaddingTop(20);
			tancellval.setBorder(Rectangle.NO_BORDER);*/
			stcellval_1.setBorder(0);
			stcellval_1.setHorizontalAlignment(Element.ALIGN_LEFT);
			stcellval_1.setPaddingTop(5);
			stcellval_1.setPaddingLeft(0);
			companydetailscontenttbl.addCell(stcellval_1);
			
		}
			
		writedetailstbl = new PdfPTable(1);
		writedetailstbl.setWidthPercentage(100);
		writedetailstbl.setSpacingBefore(15f);
		
		PdfPCell writedetailstblcell = new PdfPCell(new Paragraph("Wire transfer details",font10));
		writedetailstblcell.setHorizontalAlignment(Element.ALIGN_LEFT);
		writedetailstblcell.setBorder(0);
		writedetailstblcell.setPaddingTop(10);
		writedetailstbl.addCell(writedetailstblcell);
		
		float[] columnWidths = {1.5f,0.2f,6f};
		writedetailscontenttbl = new PdfPTable(columnWidths);
		writedetailscontenttbl.setHorizontalAlignment(Element.ALIGN_LEFT);
		writedetailscontenttbl.setWidthPercentage(100);
		writedetailscontenttbl.setSpacingBefore(25f);
			
			saptadetailslist = new SaptaProfileService().retriveList();
			
			for(SaptaProfileDO saptaDetails : saptadetailslist ){
				PdfPCell detailscontenttblcell_1 = new PdfPCell(new Paragraph("Account Name",font8));
				detailscontenttblcell_1.setBorder(0);
				detailscontenttblcell_1.setPaddingTop(5);
				writedetailscontenttbl.addCell(detailscontenttblcell_1);
				
				PdfPCell coloncell_1 = new PdfPCell(new Paragraph(":",font8));
				coloncell_1.setBorder(0);
				coloncell_1.setHorizontalAlignment(Element.ALIGN_LEFT);
				coloncell_1.setPaddingTop(5);
				coloncell_1.setPaddingLeft(0);
				writedetailscontenttbl.addCell(coloncell_1);
				
				PdfPCell name_value = new PdfPCell(new Paragraph(saptaDetails.getAccntname(),font8));
				name_value.setBorder(0);
				name_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				name_value.setPaddingTop(5);
				name_value.setPaddingLeft(0);
				writedetailscontenttbl.addCell(name_value);
				
				PdfPCell detailscontenttblcell_2 = new PdfPCell(new Paragraph("Account Number",font8));
				detailscontenttblcell_2.setBorder(0);
				detailscontenttblcell_2.setPaddingTop(5);
				writedetailscontenttbl.addCell(detailscontenttblcell_2);
				
				PdfPCell coloncell_2 = new PdfPCell(new Paragraph(":",font8));
				coloncell_2.setBorder(0);
				coloncell_2.setHorizontalAlignment(Element.ALIGN_LEFT);
				coloncell_2.setPaddingTop(5);
				coloncell_2.setPaddingLeft(0);
				writedetailscontenttbl.addCell(coloncell_2);
				
				PdfPCell number_value = new PdfPCell(new Paragraph(String.valueOf(saptaDetails.getAccntnum()),font8));
				number_value.setBorder(0);
				number_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				number_value.setPaddingTop(5);
				number_value.setPaddingLeft(0);
				writedetailscontenttbl.addCell(number_value);
				
				PdfPCell detailscontenttblcell_3 = new PdfPCell(new Paragraph("Bank Name",font8));
				detailscontenttblcell_3.setBorder(0);
				detailscontenttblcell_3.setPaddingTop(5);
				writedetailscontenttbl.addCell(detailscontenttblcell_3);
				
				PdfPCell coloncell_3 = new PdfPCell(new Paragraph(":",font8));
				coloncell_3.setBorder(0);
				coloncell_3.setHorizontalAlignment(Element.ALIGN_LEFT);
				coloncell_3.setPaddingTop(5);
				coloncell_3.setPaddingLeft(0);
				writedetailscontenttbl.addCell(coloncell_3);
				
				PdfPCell bankname_value = new PdfPCell(new Paragraph(saptaDetails.getBankname(),font8));
				bankname_value.setBorder(0);
				bankname_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				bankname_value.setPaddingTop(5);
				bankname_value.setPaddingLeft(0);
				writedetailscontenttbl.addCell(bankname_value);
				
				PdfPCell detailscontenttblcell_4 = new PdfPCell(new Paragraph("Bank Branch",font8));
				detailscontenttblcell_4.setBorder(0);
				detailscontenttblcell_4.setPaddingTop(5);
				writedetailscontenttbl.addCell(detailscontenttblcell_4);
				
				PdfPCell coloncell_4 = new PdfPCell(new Paragraph(":",font8));
				coloncell_4.setBorder(0);
				coloncell_4.setHorizontalAlignment(Element.ALIGN_LEFT);
				coloncell_4.setPaddingTop(5);
				coloncell_4.setPaddingLeft(0);
				writedetailscontenttbl.addCell(coloncell_4);
				
				PdfPCell bankbranch_value = new PdfPCell(new Paragraph(saptaDetails.getBankbranch(),font8));
				bankbranch_value.setBorder(0);
				bankbranch_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				bankbranch_value.setPaddingTop(5);
				bankbranch_value.setPaddingLeft(0);
				writedetailscontenttbl.addCell(bankbranch_value);
				
				PdfPCell detailscontenttblcell_5 = new PdfPCell(new Paragraph("IFSC Code",font8));
				detailscontenttblcell_5.setBorder(0);
				detailscontenttblcell_5.setPaddingTop(5);
				writedetailscontenttbl.addCell(detailscontenttblcell_5);
				
				PdfPCell coloncell_5 = new PdfPCell(new Paragraph(":",font8));
				coloncell_5.setBorder(0);
				coloncell_5.setHorizontalAlignment(Element.ALIGN_LEFT);
				coloncell_5.setPaddingTop(5);
				coloncell_5.setPaddingLeft(0);
				writedetailscontenttbl.addCell(coloncell_5);
				
				PdfPCell ifsccode_value = new PdfPCell(new Paragraph(saptaDetails.getIfsccode(),font8));
				ifsccode_value.setBorder(0);
				ifsccode_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				ifsccode_value.setPaddingTop(5);
				ifsccode_value.setPaddingLeft(0);
				writedetailscontenttbl.addCell(ifsccode_value);
				
				PdfPCell detailscontenttblcell_6 = new PdfPCell(new Paragraph("Swift Code",font8));
				detailscontenttblcell_6.setBorder(0);
				detailscontenttblcell_6.setPaddingTop(5);
				writedetailscontenttbl.addCell(detailscontenttblcell_6);
				
				PdfPCell coloncell_6 = new PdfPCell(new Paragraph(":",font8));
				coloncell_6.setBorder(0);
				coloncell_6.setPaddingTop(5);
				coloncell_6.setPaddingLeft(0);
				writedetailscontenttbl.addCell(coloncell_6);
				
				PdfPCell swiftcode_value = new PdfPCell(new Paragraph(saptaDetails.getSwiftcode(),font8));
				swiftcode_value.setBorder(0);
				swiftcode_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				swiftcode_value.setPaddingTop(5);
				swiftcode_value.setPaddingLeft(0);
				writedetailscontenttbl.addCell(swiftcode_value);
				
				PdfPCell detailscontenttblcell_7 = new PdfPCell(new Paragraph("Bank Address",font8));
				detailscontenttblcell_7.setBorder(0);
				detailscontenttblcell_7.setPaddingTop(5);
				writedetailscontenttbl.addCell(detailscontenttblcell_7);
				
				PdfPCell coloncell_7 = new PdfPCell(new Paragraph(":",font8));
				coloncell_7.setBorder(0);
				coloncell_7.setPaddingTop(5);
				coloncell_7.setPaddingLeft(0);
				writedetailscontenttbl.addCell(coloncell_7);
				
				PdfPCell branchaddress_value = new PdfPCell(new Paragraph(saptaDetails.getBranchaddress(),font8));
				branchaddress_value.setBorder(0);
				branchaddress_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				branchaddress_value.setPaddingTop(5);
				branchaddress_value.setPaddingLeft(0);
				writedetailscontenttbl.addCell(branchaddress_value);
			}
			
			thankstbl = new PdfPTable(1);
			thankstbl.setWidthPercentage(100);
			thankstbl.setSpacingBefore(50f);
			
			PdfPCell thankscell = new PdfPCell(new Paragraph("Thank you for your business",font8));
			thankscell.setBorder(0);
			thankscell.setHorizontalAlignment(Element.ALIGN_CENTER);
			thankscell.setPaddingTop(5);
			thankscell.setPaddingLeft(0);
			thankstbl.addCell(thankscell);
			
        
	        InvoicePDFUtil event = new InvoicePDFUtil(FooterUtil.getFooterDetails(req));
	        writer.setPageEvent(event);
			
	        document.open();
			document.add(logo);
			document.add(tanandpantbl);
			document.add(pantbl);
			document.add(horizontalrow);
			document.add(invoicenumtbl);
			document.add(billto);
			/*for(InvoiceDO invoiceDO : invoicelist){
				if(String.valueOf(invoiceDO.getInvoicestatus()).equalsIgnoreCase("i")){
					document.add(receiveddetailstable);
				}
			}*/
			document.add(duedatetbl);
			document.add(totaltbl);
			for(InvoiceDO invoiceDO : invoicelist){
				document.add(subtotaltbl);
				if(String.valueOf(invoiceDO.getAmounttype()).equalsIgnoreCase("inr")){
					document.add(servicetaxtable);
				}
				document.add(totallinetbl);
			}
			document.add(grandtotal);
			document.newPage();
			document.add(logo);
			/*document.add(tanandpantbl);
			document.add(pantbl);*/
			document.add(companydetailstbl);
			document.add(companydetailscontenttbl);
			document.add(writedetailstbl);
			document.add(writedetailscontenttbl);
			document.add(thankstbl);
			document.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 

}
