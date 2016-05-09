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
import com.sapta.hr.domainobject.ExpTypeDO;
import com.sapta.hr.domainobject.ExpenseDO;
import com.sapta.hr.service.ExpTypeService;
import com.sapta.hr.service.ExpenseService;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.HeaderFooterPDFUtil;
import com.sapta.hr.web.util.HeaderUtil;


@SuppressWarnings("serial")
@WebServlet("/expensepdfreport")
public class ExpenseReportServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		List<ExpenseDO> expenselist = null;
		
		PdfPTable horizontalrow = null;
		PdfPTable totalamount = null;
		PdfPTable expenserow = null;
		PdfPTable expensevalues = null;
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
			Font fontbold10 = new Font(base, 8, Font.BOLD, BaseColor.BLACK);
			Font font6 = new Font(base, 6, Font.NORMAL, BaseColor.BLACK);
			resp.setContentType("application/pdf");
			resp.setHeader("Content-Disposition","attachment; filename=\""+startDate+"_"+endDate+"_"+"Expense_Report.pdf\"");
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
			
			PdfPCell contenerowcell = new PdfPCell(new Paragraph("Expense report between"+" "+startDate+" and "+endDate, fontitalic10));
			contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenerowcell.setBorder(0);
			contenerowcell.setPaddingTop(-5);
			horizontalrow.addCell(contenerowcell);
			
			document.add(horizontalrow);		
					
			totalamount = new PdfPTable(1);
			totalamount.setWidthPercentage(100);
			totalamount.setSpacingBefore(10f);
			
			expenselist = new ExpenseService().getFinancialYearExpenseReport(CommonUtil.convertStringToDate(startDate), CommonUtil.convertStringToDate(endDate));
			for (ExpenseDO expenseDO : expenselist) {
				totalpay = totalpay + (expenseDO.getAmount());
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
			
			expenserow = new PdfPTable(8);
			expenserow.setHorizontalAlignment(Element.ALIGN_LEFT);
			expenserow.setWidthPercentage(100);
			expenserow.setSpacingBefore(30f);
			expenserow.setWidths(new float[]{10f,10f,10f,10f,10f,10f,10f,30f});
				
			PdfPCell row1col5 = new PdfPCell(new Paragraph("Date", fontbold10));
			row1col5.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col5.setBackgroundColor(new BaseColor(211,211,211));
			row1col5.setBorderColor(BaseColor.GRAY);
			expenserow.addCell(row1col5);
			
			PdfPCell row1col1 = new PdfPCell(new Paragraph("Expense Id", fontbold10));
			row1col1.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col1.setFixedHeight(15);
			row1col1.setBackgroundColor(new BaseColor(211,211,211));
			row1col1.setBorderColor(BaseColor.GRAY);
			//row1col1.setFixedHeight(15);
			expenserow.addCell(row1col1);
			
			PdfPCell row1col2 = new PdfPCell(new Paragraph("Bill No", fontbold10));
			row1col2.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col2.setBackgroundColor(new BaseColor(211,211,211));
			row1col2.setBorderColor(BaseColor.GRAY);
			expenserow.addCell(row1col2);
			
			PdfPCell row1col3 = new PdfPCell(new Paragraph("Expense Type", fontbold10));
			row1col3.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col3.setBackgroundColor(new BaseColor(211,211,211));
			row1col3.setBorderColor(BaseColor.GRAY);
			expenserow.addCell(row1col3);
			
			PdfPCell row1col4 = new PdfPCell(new Paragraph("Category", fontbold10));
			row1col4.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col4.setBackgroundColor(new BaseColor(211,211,211));
			row1col4.setBorderColor(BaseColor.GRAY);
			expenserow.addCell(row1col4);
			
			PdfPCell row1col6 = new PdfPCell(new Paragraph("Amount", fontbold10));
			row1col6.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col6.setBackgroundColor(new BaseColor(211,211,211));
			row1col6.setBorderColor(BaseColor.GRAY);
			expenserow.addCell(row1col6);
			
			PdfPCell row1col7 = new PdfPCell(new Paragraph("MOP", fontbold10));
			row1col7.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col7.setBackgroundColor(new BaseColor(211,211,211));
			row1col7.setBorderColor(BaseColor.GRAY);
			expenserow.addCell(row1col7);
			
			PdfPCell row1col8 = new PdfPCell(new Paragraph("Description", fontbold10));
			row1col8.setHorizontalAlignment(Element.ALIGN_CENTER);
			row1col8.setBackgroundColor(new BaseColor(211,211,211));
			row1col8.setBorderColor(BaseColor.GRAY);
			expenserow.addCell(row1col8);
			
			document.add(expenserow);
			
			for (ExpenseDO expenseDO : expenselist) {
			
				
			//	expensevalues = new PdfPTable(columnWidth);
				expensevalues = new PdfPTable(8);
				expensevalues.setHorizontalAlignment(Element.ALIGN_LEFT);
				expensevalues.setWidthPercentage(100);
				expensevalues.setWidths(new float[]{10f,10f,10f,10f,10f,10f,10f,30f});
				
				PdfPCell row2col5 = new PdfPCell(new Paragraph(((CommonUtil.convertDateToStringWithOutTime(expenseDO.getExpdate())).toString()), font8)); 
				row2col5.setHorizontalAlignment(Element.ALIGN_CENTER);
				row2col5.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(row2col5);
				
				PdfPCell refnumcell_value = new PdfPCell(new Paragraph((expenseDO.getId()).toString(), font8));
				refnumcell_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				refnumcell_value.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(refnumcell_value);
	
				PdfPCell row2col2 = null;
				if(expenseDO.getBillno() == null || expenseDO.getBillno() == ""){
					row2col2 = new PdfPCell(new Paragraph((("")), font8)); 
				}else{
					row2col2 = new PdfPCell(new Paragraph(((expenseDO.getBillno())), font8));
				}
				row2col2.setHorizontalAlignment(Element.ALIGN_LEFT);
				row2col2.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(row2col2);
		
				List<ExpTypeDO> expenseTypeList = new ExpTypeService().retriveById(expenseDO.getExptypeid());
				PdfPCell row2col3 = new PdfPCell(new Paragraph(expenseTypeList.get(0).getDispname(), font8)); 
				row2col3.setHorizontalAlignment(Element.ALIGN_LEFT);
				row2col3.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(row2col3);
				
				PdfPCell row2col4 = new PdfPCell(new Paragraph(((expenseDO.getCategory())), font8)); 
				row2col4.setHorizontalAlignment(Element.ALIGN_CENTER);
				row2col4.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(row2col4);
				
				PdfPCell row2col6 = new PdfPCell(new Paragraph(((decimalformat.format(expenseDO.getAmount())).toString()), font8)); 
				row2col6.setHorizontalAlignment(Element.ALIGN_RIGHT);
				row2col6.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(row2col6);
				
				
				PdfPCell row2col7 = null ;
				char modeofpay = expenseDO.getModeofpay();
				if(modeofpay == 'c'){
					 row2col7 = new PdfPCell(new Paragraph((("Cash")), font8)); 
				}else if(modeofpay == 'a'){
					 row2col7 = new PdfPCell(new Paragraph((("Card")), font8)); 
				}else if(modeofpay == 'q'){
					 row2col7 = new PdfPCell(new Paragraph((("Cheque")), font8)); 
				}else{
					 row2col7 = new PdfPCell(new Paragraph((("Online Payment")), font8)); 
				}
				row2col7.setHorizontalAlignment(Element.ALIGN_CENTER);
				row2col7.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(row2col7);
				
				PdfPCell row2col8 = new PdfPCell(new Paragraph(((expenseDO.getDescription())), font8)); 
				row2col8.setHorizontalAlignment(Element.ALIGN_LEFT);
				row2col8.setBorderColor(BaseColor.GRAY);
				expensevalues.addCell(row2col8);
					
				document.add(expensevalues);
			}	
			
			
			document.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	} 
}
