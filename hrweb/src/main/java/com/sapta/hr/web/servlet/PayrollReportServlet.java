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
import com.sapta.hr.domainobject.EmpAccDetailDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.EmpAccDetailService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.HeaderFooterPDFUtil;
import com.sapta.hr.web.util.HeaderUtil;


@SuppressWarnings("serial")
@WebServlet("/payrollpdfreport")
public class PayrollReportServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		List<PayrollDO> payrolllist = null;
		List<EmpAccDetailDO> employeelist = null;
		List<EmployeeDO> employeeDO = null;
		List<VendorDO> vendorlist = null;
		
		PdfPTable horizontalrow = null;
		PdfPTable totalamount = null;
		PdfPTable payrollheading = null;
		PdfPTable payrollvalues = null;
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
			resp.setHeader("Content-Disposition","attachment; filename=\""+startDate+"_"+endDate+"_"+"Payroll_Report.pdf\"");
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
			
			PdfPCell contenerowcell = new PdfPCell(new Paragraph("Payroll report between"+" "+startDate+" and "+endDate, fontitalic10));
			contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenerowcell.setBorder(0);
			contenerowcell.setPaddingTop(-5);
			horizontalrow.addCell(contenerowcell);
			
			document.add(horizontalrow);		
					
			totalamount = new PdfPTable(1);
			totalamount.setWidthPercentage(100);
			totalamount.setSpacingBefore(10f);
			
			payrolllist = new PayrollService().getFinancialYearPayrollReport(CommonUtil.convertStringToDate(startDate), CommonUtil.convertStringToDate(endDate));
			for (PayrollDO payrollDO : payrolllist) {
				totalpay = totalpay + (payrollDO.getNetpayableamount());
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
		
			payrollheading = new PdfPTable(7);
			payrollheading.setHorizontalAlignment(Element.ALIGN_LEFT);
			payrollheading.setWidthPercentage(100);
			payrollheading.setSpacingBefore(30f);
			payrollheading.setWidths(new float[]{15f,15f,45f,15f,25f,30f, 15f});
			
			PdfPCell payrollmnth = new PdfPCell(new Paragraph("Payroll Month", fontbold8));
			payrollmnth.setHorizontalAlignment(Element.ALIGN_CENTER);
			payrollmnth.setBackgroundColor(new BaseColor(211,211,211));
			payrollmnth.setBorderColor(BaseColor.GRAY);
			payrollheading.addCell(payrollmnth);
			
			PdfPCell empid = new PdfPCell(new Paragraph("Employee Id", fontbold8));
			empid.setHorizontalAlignment(Element.ALIGN_CENTER);
			empid.setBackgroundColor(new BaseColor(211,211,211));
			empid.setBorderColor(BaseColor.GRAY);
			payrollheading.addCell(empid);
			
			PdfPCell empname = new PdfPCell(new Paragraph("Employee Name", fontbold8));
			empname.setHorizontalAlignment(Element.ALIGN_CENTER);
			empname.setBackgroundColor(new BaseColor(211,211,211));
			empname.setBorderColor(BaseColor.GRAY);
			payrollheading.addCell(empname);
			
			PdfPCell dayspayable = new PdfPCell(new Paragraph("Days Payable", fontbold8));
			dayspayable.setHorizontalAlignment(Element.ALIGN_CENTER);
			dayspayable.setBackgroundColor(new BaseColor(211,211,211));
			dayspayable.setBorderColor(BaseColor.GRAY);
			payrollheading.addCell(dayspayable);
			
			PdfPCell amount = new PdfPCell(new Paragraph("Amount ", fontbold8));
			amount.setHorizontalAlignment(Element.ALIGN_CENTER);
			amount.setBackgroundColor(new BaseColor(211,211,211));
			amount.setBorderColor(BaseColor.GRAY);
			payrollheading.addCell(amount);
			
			PdfPCell accountno = new PdfPCell(new Paragraph("Account No", fontbold8));
			accountno.setHorizontalAlignment(Element.ALIGN_CENTER);
			accountno.setBackgroundColor(new BaseColor(211,211,211));
			accountno.setBorderColor(BaseColor.GRAY);
			payrollheading.addCell(accountno);
			
			PdfPCell paidon = new PdfPCell(new Paragraph("Paid On", fontbold8));
			paidon.setHorizontalAlignment(Element.ALIGN_CENTER);
			paidon.setBackgroundColor(new BaseColor(211,211,211));
			paidon.setBorderColor(BaseColor.GRAY);
			payrollheading.addCell(paidon);
			
			document.add(payrollheading);
			
			for (PayrollDO payrollDO : payrolllist) {
		
				payrollvalues = new PdfPTable(7);
				payrollvalues.setHorizontalAlignment(Element.ALIGN_LEFT);
				payrollvalues.setWidthPercentage(100);
				payrollvalues.setWidths(new float[]{15f,15f,45f,15f,25f,30f, 15f});
				
				PdfPCell payrollmnth_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(payrollDO.getPayrollmonth()), font8));
				payrollmnth_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				payrollmnth_value.setBorderColor(BaseColor.GRAY);
				payrollvalues.addCell(payrollmnth_value);
				
				PdfPCell billno_value = new PdfPCell(new Paragraph(payrollDO.getEmpid().toString(), font8));
				billno_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				billno_value.setBorderColor(BaseColor.GRAY);
				payrollvalues.addCell(billno_value);
				
				employeeDO = new EmployeeService().retriveById(payrollDO.getEmpid());
				
				if(employeeDO.get(0).getMname() == null){
					PdfPCell empname_value = new PdfPCell(new Paragraph(employeeDO.get(0).getFname() +" "+employeeDO.get(0).getLname(), font8));
					empname_value.setHorizontalAlignment(Element.ALIGN_LEFT);
					empname_value.setBorderColor(BaseColor.GRAY);
					payrollvalues.addCell(empname_value);
            	}
            	else{
            		PdfPCell empname_value = new PdfPCell(new Paragraph(employeeDO.get(0).getFname() +" "+employeeDO.get(0).getMname()+" "+employeeDO.get(0).getLname(), font8));
					empname_value.setHorizontalAlignment(Element.ALIGN_LEFT);
					empname_value.setBorderColor(BaseColor.GRAY);
					payrollvalues.addCell(empname_value);
            	}
				
				PdfPCell billdate_value = new PdfPCell(new Paragraph(payrollDO.getDayspayable().toString(), font8));
				billdate_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				billdate_value.setBorderColor(BaseColor.GRAY);
				payrollvalues.addCell(billdate_value);
				
				PdfPCell amount_value = new PdfPCell(new Paragraph(decimalformat.format(payrollDO.getNetpayableamount()), font8)); 
				amount_value.setHorizontalAlignment(Element.ALIGN_RIGHT);
				amount_value.setBorderColor(BaseColor.GRAY);
				amount_value.setPaddingRight(5);
				payrollvalues.addCell(amount_value);
				
				employeelist = new EmpAccDetailService().retriveByEmpId(payrollDO.getEmpid());
				
				if(employeelist.size() > 0 && employeelist != null){
					if(employeelist.get(0).getAccountno() != null && employeelist.get(0).getAccountno() > 0){
						PdfPCell accountno_value = new PdfPCell(new Paragraph(employeelist.get(0).getAccountno().toString(), font8));
						accountno_value.setHorizontalAlignment(Element.ALIGN_LEFT);
						accountno_value.setBorderColor(BaseColor.GRAY);
						accountno_value.setPaddingRight(5);
						payrollvalues.addCell(accountno_value);
					}else{
						PdfPCell accountno_value = new PdfPCell(new Paragraph("", font8));
						accountno_value.setHorizontalAlignment(Element.ALIGN_LEFT);
						accountno_value.setBorderColor(BaseColor.GRAY);
						accountno_value.setPaddingRight(5);
						payrollvalues.addCell(accountno_value);
					}
				}
				
				PdfPCell paidon_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(payrollDO.getPaidon()), font8));
				paidon_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				paidon_value.setBorderColor(BaseColor.GRAY);
				payrollvalues.addCell(paidon_value);
				
				document.add(payrollvalues);
			}	
			
			document.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	} 
}
