package egovframework.example.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.service.DonguNoticeService;
import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.Search;

@Controller
public class DonguNoticeController {

	@Autowired
	DonguNoticeService donguNoticeService;
	
	@RequestMapping(value="notice.do")
	public String notice(Model model
			,@RequestParam(required=false,defaultValue="1")int page
			,@RequestParam(required=false,defaultValue="1")int range
			,@RequestParam(required=false,defaultValue="title")String searchType
			,@RequestParam(required=false)String keyword
			,@ModelAttribute("search")Search search) throws Exception {
		
		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//전체 개시글 개수
		int listCnt = donguNoticeService.getNoticeListCnt(search);
		
		//검색 후 페이지
		search.pageInfo(page, range, listCnt);   
		//페이징
		model.addAttribute("pagination", search);
		//model.addAttribute("search", keyword);
		//게시글 화면 출력
		model.addAttribute("list", donguNoticeService.donguNoticeList(search));
		model.addAttribute("listCnt",listCnt);
				
		return "notice";
	}
	
	@RequestMapping(value="noticeDetail.do")
	public String noticeDetail(Model model,int idx,  HttpSession session) {
		
		DonguNoticeVO vo = donguNoticeService.donguNoticeDetail(idx);
		model.addAttribute("vo", vo);
		
		String sessionUserid = (String) session.getAttribute("sessionUserid");
		String writer = vo.getWriter();
		int num = vo.getIdx();
		
		if (sessionUserid == null) {
			sessionUserid = "없음";
		}
		if (!sessionUserid.equals(writer) || sessionUserid != null) {
			donguNoticeService.noticeCount(num);
		}
		
		System.out.println(writer + "ww" + sessionUserid + "logi" + num);
		return "noticeDetail";
	}
	
	@RequestMapping(value="noticeWriteForm.do")
	public String noticeWriteForm() {
		return "noticeWriteForm";
	}
	
	@RequestMapping(value="noticeWrite")
	public String noticeWrtie(DonguNoticeVO vo, HttpServletRequest request) throws Exception {
		
		String filename = null;
		String uploadPath = request.getServletContext().getRealPath("file_repo");
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFilename = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFilename);
			UUID uuid = UUID.randomUUID();
			filename = uuid + "." +ext;
			uploadFile.transferTo(new File(uploadPath +"/" + filename));
		}
		
		vo.setNoticeimg(filename);
		
		donguNoticeService.donguNoticeWrite(vo);
		return "redirect:notice.do";
	}
	
	@RequestMapping(value="noticeDelete")
	public String noticeDelete(int idx) throws Exception {
		
		donguNoticeService.noticeDelete(idx);
		
		return "redirect:notice.do";
	}
	
	@RequestMapping(value="noticeUpdateForm.do")
	public String noticeUpdateForm(int idx, Model model) {
		
		DonguNoticeVO nvo = donguNoticeService.donguNoticeDetail(idx);
		model.addAttribute("vo", nvo);
		return "noticeUpdateForm";
	}
	
	@RequestMapping(value="noticeUpdate.do")
	public String noticeUpdate(DonguNoticeVO vo,RedirectAttributes re
			,HttpServletRequest request) throws Exception {
		
		
		String filename = null;
		String uploadPath = request.getServletContext().getRealPath("file_repo");
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFilename = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFilename);
			UUID uuid = UUID.randomUUID();
			filename = uuid + "." +ext;
			uploadFile.transferTo(new File(uploadPath +"/" + filename));
		}
		
		vo.setNoticeimg(filename);
		
		re.addAttribute("idx", vo.getIdx());
		donguNoticeService.noticeUpdate(vo);
		
		return "redirect:noticeDetail.do";
	}
	
	@RequestMapping(value="excelDown2.do")
	@ResponseBody
	public void excelDown2(Model model , HttpServletResponse response
			//form hidden 데이터 가져오기
			, @RequestParam List<String> title
			, @RequestParam List<String> writer
			, @RequestParam List<String> indate
			, @RequestParam List<String> count)  throws Exception {
		
		Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("제목");
        cell = row.createCell(1);
        cell.setCellValue("작성자");
        cell = row.createCell(2);
        cell.setCellValue("날짜");
        cell = row.createCell(3);
        cell.setCellValue("조회수");
        
        // Body
        //받은 데이터 index 가져오기
        for (int i=0; i< title.size(); i++) {
        	row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(title.get(i));
            cell = row.createCell(1);
            cell.setCellValue(writer.get(i));
            cell = row.createCell(2);
            cell.setCellValue(indate.get(i));
            cell = row.createCell(3);
            cell.setCellValue(count.get(i));
        }
        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=noticeList.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
	
	
}
