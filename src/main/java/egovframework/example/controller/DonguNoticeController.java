package egovframework.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.service.DonguNoticeService;
import egovframework.example.vo.DonguNoticeVO;

@Controller
public class DonguNoticeController {

	@Autowired
	DonguNoticeService donguNoticeService;
	
	@RequestMapping(value="notice.do")
	public String notice(Model model) throws Exception {
		
		List<DonguNoticeVO> list = donguNoticeService.donguNoticeList();
		model.addAttribute("list", list);
				
		return "notice";
	}
}
