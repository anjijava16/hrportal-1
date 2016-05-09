package com.sapta.hr.web.servlet;

import java.io.IOException;
import java.net.URL;

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
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.PayslipPDFUtil;

@SuppressWarnings("serial")
@WebServlet("/viewpayslip")
public class ViewPayslipServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String employeeid = req.getParameter("employee");
		String currentdate = req.getParameter("currentmonth");
		String strCurrentMonth = req.getParameter("strcurrentmonth");
		String viewPaySlip = req.getParameter("viewpayslip");
		try {
			Document document = new Document(PageSize.A4);
			BaseFont base = BaseFont.createFont("http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/font/lato/Lato-Regular.ttf", BaseFont.WINANSI, false);
			Font font6 = new Font(base, 6, Font.NORMAL, BaseColor.BLACK);
			
			resp.setContentType(CommonConstants.APPLICATION_PDF);
			resp.setHeader("Content-Disposition","attachment; filename=\""+employeeid+"_"+strCurrentMonth+".pdf\"");
			PdfWriter writer = null;
			
			if(viewPaySlip != "" && viewPaySlip != null ){
				writer = PdfWriter.getInstance(document, resp.getOutputStream());
			}
			
			PayslipPDFUtil paySlipPDFUtil = new PayslipPDFUtil();
			PdfPTable logo = paySlipPDFUtil.logo(req);
			
			PdfPTable header = paySlipPDFUtil.header(strCurrentMonth, base);
			
			PdfPTable payslip = paySlipPDFUtil.payslip(base, employeeid, currentdate);
			
			PdfPTable headingtbl = paySlipPDFUtil.headingtbl(base);
			
			PdfPTable payroll = paySlipPDFUtil.payroll(base,employeeid,currentdate);

			PdfPTable footer = new PdfPTable(1);
			PdfPCell footercontent = new PdfPCell(new Paragraph("This is a computer generated salary slip, so signature is not required", font6));
			footercontent.setHorizontalAlignment(Element.ALIGN_CENTER);
			footercontent.setBorder(0);
			footercontent.setPaddingTop(20);
			footercontent.setPaddingBottom(20);
			footer.addCell(footercontent);
			
			paySlipPDFUtil.footer(req, writer, footer);
			
			document.open();
			document.add(logo);
			document.add(header);
			document.add(payslip);
			document.add(headingtbl);
			document.add(payroll);
			document.add(footer);
			document.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
