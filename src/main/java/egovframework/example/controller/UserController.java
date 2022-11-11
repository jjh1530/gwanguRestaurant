package egovframework.example.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.service.UserService;
import egovframework.example.vo.UserVO;

@Controller
public class UserController {
	

	@Autowired
	UserService userService;
	
	@RequestMapping(value="userLogin.do")
	@ResponseBody
	public String userLogin(UserVO vo, HttpSession session, Model model
			, HttpServletRequest request) throws Exception {
		
		String message = "";
		int count = userService.userLogin(vo);
		
		
		if (count == 1) {
			UserVO uvo = userService.user(vo);
			session.setAttribute("userSession", uvo);
			session.setMaxInactiveInterval(1800);
			
			message = "ok";
		}
		System.out.println(message);
		return message;
	}
	
	@RequestMapping("userLogout.do")
	public String franchiseLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="userRegisterForm.do")
	public String userRegisterForm() {
		return "userRegisterForm";
	}
	
	
}
