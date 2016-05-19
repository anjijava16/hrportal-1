package com.sapta.hr.web.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CTCEmailProxyUtil;
import com.sapta.hr.web.util.CommonWebUtil;

@SuppressWarnings("serial")
@WebServlet("/sendctc")
public class CTCEmailServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String employeeid = req.getParameter("employee");
		String startdate = req.getParameter("startdate");
		String employeectc = req.getParameter("employeectc");
		String value = "";
		JSONObject jsonResponse = null;
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			
			/*Document document = new Document(PageSize.A4);
			BaseFont base = BaseFont.createFont("http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/font/lato/Lato-Regular.ttf", BaseFont.WINANSI, false);
			
			resp.setContentType(CommonConstants.APPLICATION_PDF);
			
			PdfWriter writer = null;
			writer = PdfWriter.getInstance(document, baos);*/
			//CTCPDFUtil ctcPdfUtil = new CTCPDFUtil();
			/*PdfPTable logo = ctcPdfUtil.logo(req);*/
			
			/*PdfPTable revisionletter = ctcPdfUtil.revisionletter(req, base, employeeid, startdate, employeectc);
			
			PdfPTable header = HeaderUtil.getHeaderDetails(req);
			
			PdfPTable footer = FooterUtil.getFooterDetails(req);
			
			HeaderFooterPDFUtil headerfooter = new HeaderFooterPDFUtil(header, footer);
			writer.setPageEvent(headerfooter);
			
			document.open();
			document.add(revisionletter);
			document.close();*/
			
			//to send a mail
			CTCEmailProxyUtil.sendEmail(baos, startdate, employeeid, employeectc, req, resp);
			
			value = (String)req.getAttribute("resvalue");
			if(value == "true"){
				jsonResponse = CommonWebUtil.buildSuccessResponse();
				
			}else{
				jsonResponse = CommonWebUtil.buildErrorResponse("true");
			}
		} catch (Exception e) {
			jsonResponse = CommonWebUtil.buildErrorResponse(CommonConstants.ERRORS);
		}finally{
			resp.getWriter().print((jsonResponse != null) ? jsonResponse.toString() : CommonConstants.ERRORS);
		}
	}
	
}
