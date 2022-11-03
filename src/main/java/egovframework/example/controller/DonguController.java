package egovframework.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.service.DonguService;
import egovframework.example.vo.DonguVO;

@Controller
public class DonguController {
	
	@Autowired
	DonguService donguService;
	
	@RequestMapping(value="main.do")
	public String main(Model model) throws Exception {
		List<DonguVO> vo =donguService.selectTest();
		model.addAttribute("vo", vo);
		return "main";
	}
}
