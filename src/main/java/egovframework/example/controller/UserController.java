package egovframework.example.controller;


import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.service.UserService;
import egovframework.example.vo.UserVO;

@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

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
		if(logger.isInfoEnabled()) {
            logger.info("회원가입 아이디 = " + vo.getUserid() + ".");
        }
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
	
	@RequestMapping(value="registerCheck.do")
	@ResponseBody
	public String registerCheck(String userid,UserVO vo) throws Exception {
		String message = "";
		int result = userService.registerCheck(userid);
		if (result == 0 ) {
			message ="ok";
		}
		System.out.println(userid);
	   
		
		return message;
	}
	
	@RequestMapping(value="userRegister.do")
	@ResponseBody
	public String userRegister(UserVO vo) throws Exception {
		String message = "";
		int result = userService.register(vo);
		if (result == 1) {
			message ="ok";
		}
		System.out.println(message);
		return message;
	}
	
	@RequestMapping(value="userDetailForm.do")
	public String userDetailForm() {
		
		return "userDetailForm";
	}
	
	@RequestMapping(value="imageUpload.do")
	public String imageUpdate(UserVO vo, HttpServletRequest request
			,HttpSession session) throws Exception {
		
		String filename = null;
		String uploadPath = request.getServletContext().getRealPath("file_repo");
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFilename = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFilename);
			UUID uuid = UUID.randomUUID();
			filename = uuid + "." +ext;
			uploadFile.transferTo(new File(uploadPath +"/" + filename));
			vo.setFilename(filename);
		}else {
			userService.imageUpdate(vo);
		}
		userService.imageUpdate(vo);
		UserVO uvo = userService.user(vo);
		session.setAttribute("userSession", uvo);
		session.setMaxInactiveInterval(1800);
		
		return "redirect:/userDetailForm.do";
	}
	
	
@RequestMapping(value="/userPassUpdate.do")
public String userPassUpdate(UserVO vo,RedirectAttributes rttr
		,HttpSession session) throws Exception {
	
	userService.passUpdate(vo);
	UserVO uvo = userService.user(vo);
	session.setAttribute("userSession", uvo);
	session.setMaxInactiveInterval(1800);
	rttr.addFlashAttribute("msgType","수정");
	rttr.addFlashAttribute("msg","비밀번호가 변경되었습니다.");
	
	return "redirect:/userDetailForm.do";
}

}
