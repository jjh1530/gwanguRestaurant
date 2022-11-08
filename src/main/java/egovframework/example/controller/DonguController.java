package egovframework.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.service.DonguService;
import egovframework.example.vo.DonguVO;
import egovframework.example.vo.Search;

@Controller
public class DonguController {
	
	@Autowired
	DonguService donguService;
	
	@RequestMapping(value="main.do")
	public String main()  {
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
}
