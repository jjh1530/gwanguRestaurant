package egovframework.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.service.DonguService;
import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.DonguVO;
import egovframework.example.vo.Search;

@Controller
public class DonguController {
	
	@Autowired
	DonguService donguService;
	
	
	@RequestMapping(value="main.do")
	public String main(Model model, HttpServletRequest request, DonguNoticeVO vo) throws Exception  {
		
		List<DonguNoticeVO> notice = donguService.getNotice();
		model.addAttribute("notice", notice);
		return "main";
	}
	
	@RequestMapping(value="list.do")
	public String list(Model model
			,@RequestParam(required=false,defaultValue="1")int page
			,@RequestParam(required=false,defaultValue="1")int range
			,@RequestParam(required=false,defaultValue="resturantName")String searchType
			,@RequestParam(required=false)String keyword
			,@ModelAttribute("search")Search search) throws Exception {
		
		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//전체 게시글 개수
		int listCnt = donguService.getListCnt(search);
				
		//검색 후 페이지
		search.pageInfo(page, range, listCnt);
		
		//페이징
		model.addAttribute("pagination", search);
		model.addAttribute("keyword", keyword);
		
		List<DonguVO> list = donguService.donguList(search);
		model.addAttribute("list", list);
		model.addAttribute("listCnt", listCnt);
		return "list";
	}
	
	@RequestMapping(value="detail.do")
	public String detail(Model model, int id) throws Exception {
		
		DonguVO vo = donguService.donguDetail(id);
		model.addAttribute("vo", vo);
		return "detail";
	}
	
	@RequestMapping(value="kapi.do")
	public String kapi() {
		
		return "kapi";
	}
	
	@RequestMapping(value="excelDown.do")
	@ResponseBody
	public void excelDown(Model model , HttpServletResponse response
			//form hidden 데이터 가져오기
			, @RequestParam List<String> resturantName
			, @RequestParam List<String> address
			, @RequestParam List<String> restPhone
			, @RequestParam List<String> restSector)  throws Exception {
		
		Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("이름");
        cell = row.createCell(1);
        cell.setCellValue("주소");
        cell = row.createCell(2);
        cell.setCellValue("번호");
        cell = row.createCell(3);
        cell.setCellValue("업종");
        
        // Body
        //받은 데이터 index 가져오기
        for (int i=0; i< resturantName.size(); i++) {
        	row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(resturantName.get(i));
            cell = row.createCell(1);
            cell.setCellValue(address.get(i));
            cell = row.createCell(2);
            cell.setCellValue(restPhone.get(i));
            cell = row.createCell(3);
            cell.setCellValue(restSector.get(i));
        }
        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=DonguResturant.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }

	
}
