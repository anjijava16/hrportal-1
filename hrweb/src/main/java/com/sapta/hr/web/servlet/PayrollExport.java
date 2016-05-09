package com.sapta.hr.web.servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.sapta.hr.domainobject.EmpAccDetailDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.service.EmpAccDetailService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;

@SuppressWarnings("serial")
@WebServlet("/payrollexport")
public class PayrollExport extends BaseServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}

	@SuppressWarnings("static-access")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String month = req.getParameter("month");
		try {
			//Document document = new Document(PageSize.A4);
			//BaseFont base = BaseFont.createFont("http://" + new URL(req.getRequestURL().toString()).getHost() + ":" + req.getLocalPort() + "" + req.getContextPath() + "/resources/font/Verdana.ttf", BaseFont.WINANSI, false);
			//Date payrollDate = CommonUtil.convertStringToDate(month);
			
			Calendar cal = Calendar.getInstance();
			int tempday = cal.get(Calendar.DATE);
			int temppayrollmonth = cal.get(Calendar.MONTH);
			temppayrollmonth = temppayrollmonth + 1;
			
			String day = String.valueOf(tempday);
			if(tempday < 10){
				day = "0"+tempday;
			}
			
			String payrollmonth = String.valueOf(temppayrollmonth);
			if(temppayrollmonth < 10){
				payrollmonth = "0"+temppayrollmonth;
			}
			
			String fileName = "SAP87"+day+""+payrollmonth;
			
			resp.setContentType(CommonConstants.APPLICATION_CSV);
			resp.setHeader("Content-Disposition","attachment; filename=\""+fileName+"."+"001.csv");
			
			List<PayrollDO>  payrollList = new PayrollService().retriveByMonth(CommonUtil.convertStringToDate(month));
			List<EmpAccDetailDO> empacclist = null;
			List<EmployeeDO> empdetail = null;
			try {
				 XSSFWorkbook workbook = new XSSFWorkbook();
                 XSSFSheet sheet = workbook.createSheet(fileName);
                 int rowCount = 0;
                 Cell cell=null;
                 Row row = sheet.createRow(rowCount);
                 int columnCount = 0;
                 
                 XSSFFont boldFont = workbook.createFont();
                 boldFont.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
                 boldFont.setColor(XSSFFont.COLOR_RED);
                 XSSFCellStyle cellStyle = workbook.createCellStyle();
                 cellStyle.setFont(boldFont);
                 cellStyle.setAlignment(cellStyle.ALIGN_CENTER);
                 
                 DataFormat format = workbook.createDataFormat();
                 XSSFCellStyle decimalformat = workbook.createCellStyle();
                 decimalformat.setDataFormat(format.getFormat("##.00"));
                 
                 XSSFCellStyle numberformat = workbook.createCellStyle();
                 numberformat.setDataFormat(format.getFormat("#######"));
                 numberformat.setAlignment(numberformat.ALIGN_LEFT);
                 
                 cell = row.createCell(columnCount);
                 cell.setCellValue(CommonConstants.EMP_NAME);
                 cell.setCellStyle(cellStyle);
                 sheet.setColumnWidth(0, 6000);
                 
                 cell = row.createCell(++columnCount);
                 cell.setCellValue(CommonConstants.ACC_NO);
                 cell.setCellStyle(cellStyle);
                 sheet.setColumnWidth(1, 5000);
                 
                 cell = row.createCell(++columnCount);
                 cell.setCellValue(CommonConstants.C);
                 cell.setCellStyle(cellStyle);
                 sheet.setColumnWidth(2, 3000);
                 
                 cell = row.createCell(++columnCount);
                 cell.setCellValue(CommonConstants.TXN_AMOUNT);
                 cell.setCellStyle(cellStyle);
                 sheet.setColumnWidth(3, 5000);
                 
                 cell = row.createCell(++columnCount);
                 cell.setCellValue(CommonConstants.TXN_NARRATION);
                 cell.setCellStyle(cellStyle);
                 sheet.setColumnWidth(4, 5000);
                 
                 for (PayrollDO payrolllist : payrollList) {
                	empacclist = new EmpAccDetailService().retriveByEmpId(payrolllist.getEmpid());
					empdetail = new EmployeeService().retriveById(payrolllist.getEmpid());
	            	
					++rowCount;
					row = sheet.createRow(rowCount);
					columnCount = 0;
                    cell = row.createCell(columnCount);
                    if(empdetail.get(0).getMname() != null && empdetail.get(0).getMname().length() > 0){
                    	cell.setCellValue(empdetail.get(0).getFname()+" "+empdetail.get(0).getMname()+" "+empdetail.get(0).getLname());
					}else{
						cell.setCellValue(empdetail.get(0).getFname()+" "+empdetail.get(0).getLname());
					}
                  /*  cell.setCellValue(empdetail.get(0).getFname());*/
                    cell = row.createCell(++columnCount);
                    if(empacclist.get(0).getAccountno() != null){
                    	cell.setCellValue(empacclist.get(0).getAccountno());
                    	cell.setCellStyle(numberformat);
                    }else{
                    	cell.setCellValue("");
                    }
                    cell = row.createCell(++columnCount);
                    cell.setCellValue(CommonConstants.C_TEXT);
                    cell = row.createCell(++columnCount);
                    cell.setCellValue(payrolllist.getNetpayableamount());
                    cell.setCellStyle(decimalformat);
                    cell = row.createCell(++columnCount);
                    cell.setCellValue(CommonConstants.TXN_NARR_TEXT);
                 }
                 workbook.write(resp.getOutputStream());
                // FileOutputStream outputStream = new FileOutputStream("C:/Users/user/Desktop/"+fileName);
                   //  workbook.write(outputStream);
				
			} catch (Exception e) {
				System.out.println("Error in CsvFileWriter !!!");
				e.printStackTrace();
			} 
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
	
}
