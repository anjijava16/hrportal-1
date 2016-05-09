package com.sapta.hr.web.util;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

public class HeaderFooterPDFUtil  extends PdfPageEventHelper {
	
    protected PdfPTable footer;
    protected PdfPTable header;
    
    public HeaderFooterPDFUtil(PdfPTable header, PdfPTable footer) {
        this.header = header;
        this.footer = footer;
    }
    
    public void onStartPage(PdfWriter writer,Document document) {
    	
    	try {
			/*Image image = Image.getInstance(LOGO);
			image.scaleAbsolute(150f, 35f);
			image.setWidthPercentage(100);
			image.setAlignment(Element.ALIGN_RIGHT);
			
			document.add(image);*/
    		document.add(header);

    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public void onEndPage(PdfWriter writer,Document document) {
    	footer.writeSelectedRows(0, -1, 0, 64, writer.getDirectContent());
    }

}
