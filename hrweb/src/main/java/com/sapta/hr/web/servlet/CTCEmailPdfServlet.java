package com.sapta.hr.web.servlet;

import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CTCPDFUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.HeaderFooterPDFUtil;
import com.sapta.hr.web.util.HeaderUtil;

@SuppressWarnings("serial")
@WebServlet("/viewctc")
public class CTCEmailPdfServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String employeeid = req.getParameter("employeeid");
		String startdate = req.getParameter("startdate");
		String employeectc = req.getParameter("employeectc");
		try {
			
			Document document = new Document(PageSize.A4);
			BaseFont base = BaseFont.createFont("http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/font/lato/Lato-Regular.ttf", BaseFont.WINANSI, false);
			
			resp.setContentType(CommonConstants.APPLICATION_PDF);
			resp.setHeader("Content-Disposition","attachment; filename=\""+employeeid+"_"+startdate+".pdf\"");
			PdfWriter writer = null;
			
			writer = PdfWriter.getInstance(document, resp.getOutputStream());
			CTCPDFUtil ctcPdfUtil = new CTCPDFUtil();
			/*PdfPTable logo = ctcPdfUtil.logo(req);*/
			
			PdfPTable revisionletter = ctcPdfUtil.revisionletter(req, base, employeeid, startdate, employeectc);
			
			PdfPTable header = HeaderUtil.getHeaderDetails(req);
			
			PdfPTable footer = FooterUtil.getFooterDetails(req);
			
			HeaderFooterPDFUtil headerfooter = new HeaderFooterPDFUtil(header, footer);
			writer.setPageEvent(headerfooter);
			
			document.open();
			document.add(revisionletter);
			document.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
