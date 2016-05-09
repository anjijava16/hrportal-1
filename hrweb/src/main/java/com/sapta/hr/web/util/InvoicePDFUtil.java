package com.sapta.hr.web.util;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

public class InvoicePDFUtil  extends PdfPageEventHelper {
    protected PdfPTable footer;
    public InvoicePDFUtil(PdfPTable footer) {
        this.footer = footer;
    }
    public void onEndPage(PdfWriter writer, Document document) {
        footer.writeSelectedRows(0, -1, 0, 64, writer.getDirectContent());
    }
}
