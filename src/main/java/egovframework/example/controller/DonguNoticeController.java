package egovframework.example.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String noticeDetail(Model model,int idx) {
		
		DonguNoticeVO vo = donguNoticeService.donguNoticeDetail(idx);
		model.addAttribute("vo", vo);
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
		System.out.println(uploadFile);
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
	public String noticeUpdate(DonguNoticeVO vo,RedirectAttributes re) throws Exception {
		
		re.addAttribute("idx", vo.getIdx());
		donguNoticeService.noticeUpdate(vo);
		
		return "redirect:noticeDetail.do";
	}
	
	
}
