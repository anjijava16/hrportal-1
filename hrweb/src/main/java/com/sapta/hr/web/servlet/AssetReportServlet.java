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
import com.sapta.hr.domainobject.AssetDO;
import com.sapta.hr.domainobject.AssetTypeDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.AssetService;
import com.sapta.hr.service.AssetTypeService;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.FooterUtil;
import com.sapta.hr.web.util.HeaderFooterPDFUtil;
import com.sapta.hr.web.util.HeaderUtil;


@SuppressWarnings("serial")
@WebServlet("/assetpdfreport")
public class AssetReportServlet extends BaseServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		List<AssetDO> assetlist = null;
		List<AssetTypeDO> assettypelist = null;
		List<VendorDO> vendorlist = null;
		
		PdfPTable horizontalrow = null;
		PdfPTable totalamount = null;
		PdfPTable assetheading = null;
		PdfPTable assetvalues = null;
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
			resp.setHeader("Content-Disposition","attachment; filename=\""+startDate+"_"+endDate+"_"+"Asset_Report.pdf\"");
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
			
			PdfPCell contenerowcell = new PdfPCell(new Paragraph("Asset report between"+" "+startDate+" and "+endDate, fontitalic10));
			contenerowcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenerowcell.setBorder(0);
			contenerowcell.setPaddingTop(-5);
			horizontalrow.addCell(contenerowcell);
			
					
			document.add(horizontalrow);		
					
			totalamount = new PdfPTable(1);
			totalamount.setWidthPercentage(100);
			totalamount.setSpacingBefore(10f);
			
			assetlist = new AssetService().getFinancialYearAssetReport(CommonUtil.convertStringToDate(startDate), CommonUtil.convertStringToDate(endDate));
			for (AssetDO assetDO : assetlist) {
				totalpay = totalpay + (assetDO.getPrice());
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
			
		
			assetheading = new PdfPTable(6);
			assetheading.setHorizontalAlignment(Element.ALIGN_LEFT);
			assetheading.setWidthPercentage(100);
			assetheading.setSpacingBefore(30f);
			
			PdfPCell tocell = new PdfPCell(new Paragraph("Date Of Purchase", fontbold8));
			tocell.setHorizontalAlignment(Element.ALIGN_CENTER);
			tocell.setBackgroundColor(new BaseColor(211,211,211));
			tocell.setBorderColor(BaseColor.GRAY);
			assetheading.addCell(tocell);
			
			PdfPCell refnumcell = new PdfPCell(new Paragraph("Asset Id", fontbold8));
			refnumcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			refnumcell.setBackgroundColor(new BaseColor(211,211,211));
			refnumcell.setBorderColor(BaseColor.GRAY);
			refnumcell.setFixedHeight(15);
			assetheading.addCell(refnumcell);
			

			PdfPCell totalcell = new PdfPCell(new Paragraph("Asset Name", fontbold8));
			totalcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			totalcell.setBackgroundColor(new BaseColor(211,211,211));
			totalcell.setBorderColor(BaseColor.GRAY);
			assetheading.addCell(totalcell);
			
			PdfPCell col3 = new PdfPCell(new Paragraph("Asset Type", fontbold8));
			col3.setHorizontalAlignment(Element.ALIGN_CENTER);
			col3.setBackgroundColor(new BaseColor(211,211,211));
			col3.setBorderColor(BaseColor.GRAY);
			assetheading.addCell(col3);
			
			PdfPCell fromcell = new PdfPCell(new Paragraph("Vendor Name", fontbold8));
			fromcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			fromcell.setBackgroundColor(new BaseColor(211,211,211));
			fromcell.setBorderColor(BaseColor.GRAY);
			assetheading.addCell(fromcell);
			
			PdfPCell totalhrscell = new PdfPCell(new Paragraph("Amount ", fontbold8));
			totalhrscell.setHorizontalAlignment(Element.ALIGN_CENTER);
			totalhrscell.setBackgroundColor(new BaseColor(211,211,211));
			totalhrscell.setBorderColor(BaseColor.GRAY);
			assetheading.addCell(totalhrscell);
			
			
			document.add(assetheading);
			
			for (AssetDO assetDO : assetlist) {
		
				assetvalues = new PdfPTable(6);
				assetvalues.setHorizontalAlignment(Element.ALIGN_LEFT);
				assetvalues.setWidthPercentage(100);
				
				PdfPCell tocell_value = new PdfPCell(new Paragraph(CommonUtil.convertDateToStringWithOutTime(assetDO.getDateofpurchased()), font8));
				tocell_value.setHorizontalAlignment(Element.ALIGN_CENTER);
				tocell_value.setBorderColor(BaseColor.GRAY);
				assetvalues.addCell(tocell_value);
				
				PdfPCell refnumcell_value = new PdfPCell(new Paragraph(assetDO.getId().toString(), font8));
				refnumcell_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				refnumcell_value.setBorderColor(BaseColor.GRAY);
				refnumcell_value.setFixedHeight(15);
				assetvalues.addCell(refnumcell_value);
				
				PdfPCell ratecell_value = new PdfPCell(new Paragraph((assetDO.getName()), font8));
				ratecell_value.setHorizontalAlignment(Element.ALIGN_LEFT);
				ratecell_value.setBorderColor(BaseColor.GRAY);
				assetvalues.addCell(ratecell_value);
				
				assettypelist = new AssetTypeService().retriveById(assetDO.getAssettypeid());
				//assettypelist = new AssetTypeService().
				PdfPCell row2col3 = new PdfPCell(new Paragraph((assettypelist.get(0).getDispname()), font8));
				row2col3.setHorizontalAlignment(Element.ALIGN_LEFT);
				row2col3.setBorderColor(BaseColor.GRAY);
				assetvalues.addCell(row2col3);

	
				vendorlist = new VendorService().retriveById(assetDO.getVendorid());
				if(vendorlist.size() > 0 && vendorlist != null){
						PdfPCell fromcell_value = new PdfPCell(new Paragraph(vendorlist.get(0).getName(), font8));
						fromcell_value.setHorizontalAlignment(Element.ALIGN_LEFT);
						fromcell_value.setBorderColor(BaseColor.GRAY);
						assetvalues.addCell(fromcell_value);
				}
	
				PdfPCell totalcell_amount = new PdfPCell(new Paragraph(decimalformat.format(assetDO.getPrice()), font8)); 
				totalcell_amount.setHorizontalAlignment(Element.ALIGN_RIGHT);
				totalcell_amount.setBorderColor(BaseColor.GRAY);
				totalcell_amount.setPaddingRight(5);
				assetvalues.addCell(totalcell_amount);
				
					
				document.add(assetvalues);
			}	
			
			
			document.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	} 
}
