package com.boat.Service.Attandance;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.domain.Attandance;
import com.boat.mybatis.mapper.AttandanceMapper;

@Service
public class AttandanceServiceImpl implements AttandanceService {
	
	private static final Logger logger = LoggerFactory.getLogger(AttandanceServiceImpl.class);
	private AttandanceMapper dao;
	//private LogAdvice log;
	
	@Autowired
	public AttandanceServiceImpl(AttandanceMapper dao) {
		this.dao = dao;
	}


	@Override
	public List<Attandance> getAttList() {
		return dao.getAttList();
	}
	
	//개인 리스트가져오기(여러날)
	@Override
	public List<Attandance> getAttList(String eMPNO) {
		logger.info(eMPNO);
		 return dao.getAttList(eMPNO);
	}



	@Override//(당일)
	public Attandance getTodayMyatt(String EMPNO) {
		//HashMap<String,String>map = new HashMap<String,String>();
		//map.put("EMPNO", EMPNO);
		
		return dao.getTodayMyatt(EMPNO);
	}

	@Override
	public void AttOn(String on, String EMPNO,String DEPT,String NAME) {
		//HashMap<String,String>map = new HashMap<String,String>();
		//map.put("on",on);
		//map.put("EMPNO", EMPNO);
		//map.put("DEPT", DEPT);
		dao.AttOn(on,EMPNO,DEPT,NAME);
		
	}


	@Override
	public void AttOff(String OFF_TIME, String EMPNO) {
		//HashMap<String,String>map = new HashMap<String,String>();
		//map.put("off",off);
		//map.put("empno", empno);
		//System.out.println("offupdate param"+off);
		//log.info("offupdate param"+off);
		dao.AttOff(OFF_TIME,EMPNO);
	}

	private CellStyle getHeaderCellStyle(Workbook workbook) {
		CellStyle headerCellStyle = workbook.createCellStyle();
		headerCellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		headerCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headerCellStyle.setAlignment(HorizontalAlignment.CENTER);
		headerCellStyle.setBorderTop(BorderStyle.THIN);
		headerCellStyle.setBorderBottom(BorderStyle.THIN);
		headerCellStyle.setBorderLeft(BorderStyle.THIN);
		headerCellStyle.setBorderRight(BorderStyle.THIN);
		headerCellStyle.setWrapText(true);
		
		return headerCellStyle;
	}
	
	private CellStyle getBodyCellStyle(Workbook workbook) {
		CellStyle bodyCellStyle = workbook.createCellStyle();
		bodyCellStyle.setBorderTop(BorderStyle.THIN);
		bodyCellStyle.setBorderBottom(BorderStyle.THIN);
		bodyCellStyle.setBorderLeft(BorderStyle.THIN);
		bodyCellStyle.setBorderRight(BorderStyle.THIN);
		bodyCellStyle.setWrapText(true);
		
		return bodyCellStyle;
	}

	//출퇴근 리스트 엑셀파일 다운로드
	@Override
	public void getExceldata(Attandance att, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//dept 받아서 부서별 엑셀다운
		//String dept = getDEPT()
		//List<Attandance> alllist = dao.getAttList();
		List<Attandance> list = dao.getAttList(att.getEMPNO());
		
		
		SXSSFWorkbook wb = new SXSSFWorkbook();
		  Sheet sheet = wb.createSheet();
		  sheet.setColumnWidth((short) 0, (short) 2000);
		  sheet.setColumnWidth((short) 1, (short) 8000);
		  sheet.setColumnWidth((short) 2, (short) 3000);
		  sheet.setColumnWidth((short) 3, (short) 3000);
		  sheet.setColumnWidth((short) 4, (short) 8000);
		  sheet.setColumnWidth((short) 5, (short) 5000);
		  sheet.setColumnWidth((short) 6, (short) 3000);
		  
		  Row row = sheet.createRow(0);
		  Cell cell = null;
		  CellStyle cs = wb.createCellStyle();
		  Font font = wb.createFont();
		  cell = row.createCell(0);
		  cell.setCellValue("근태관리-출퇴근 목록");
		  getHeaderCellStyle(wb);
		  sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 6));
		  
		  row = sheet.createRow(1);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont();
		  
		  
		  cell = row.createCell(0);
		  cell.setCellValue("번호");
		  getHeaderCellStyle(wb);
		  
		  cell = row.createCell(1);
		  cell.setCellValue("출근 날짜");
		  getHeaderCellStyle(wb);
		 
		  cell = row.createCell(2);
		  cell.setCellValue("이름");
		  getHeaderCellStyle(wb);
		  
		  cell = row.createCell(3);
		  cell.setCellValue("시작 시간");
		  getHeaderCellStyle(wb);
		  
		  cell = row.createCell(4);
		  cell.setCellValue("종료 시간");
		  getHeaderCellStyle(wb);

		  
		  cell = row.createCell(5);
		  cell.setCellValue("부서명");
		  getHeaderCellStyle(wb);
		  
		  
		 
		  int i = 2;
		  int ii = list.size();
		  for (Attandance attlist:list) {
		      
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd H:m");
		String st = attlist.getON_TIME();
		Date stt = sdf.parse(st);
		String et = attlist.getOFF_TIME();
		Date ett = sdf.parse(st);
		logger.info(stt.toLocaleString());
		
		//String startTime = sdf.format();
		//String endTime = sdf.format();
		 
		  row = sheet.createRow(i);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont();
		 
		  cell = row.createCell(0);
		  cell.setCellValue(ii);
		  
		  cell = row.createCell(1);
		  cell.setCellValue(attlist.getREG_DATE());
		  
		  cell = row.createCell(2);
		  cell.setCellValue(attlist.getNAME());
		  
		  
		  cell = row.createCell(3);
		  cell.setCellValue(stt.toLocaleString());
		  
		  cell = row.createCell(4);
		  cell.setCellValue(ett.toLocaleString());
		  
		
		 
		  cell = row.createCell(5);
		  cell.setCellValue(attlist.getDEPT());
		  
		  
		  i++;
		  ii--;
		}
		  
		  response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		  response.setHeader("Content-Disposition", String.format("attachment; filename=\"Attendacelist.xlsx\""));
		  wb.write(response.getOutputStream());
		 
		
	}

	

}
