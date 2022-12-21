package egovframework.example.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.example.service.KaKaoService;
import egovframework.example.service.UserService;
import egovframework.example.vo.UserVO;

@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	UserService userService;
	
	@Autowired
	KaKaoService kakaoService;
	
	@RequestMapping(value="userLogin.do")
	@ResponseBody
	public String userLogin(UserVO vo, HttpSession session, Model model
			, HttpServletRequest request) throws Exception {
		
		String message = "";
		int count = userService.userLogin(vo);
		String userid = vo.getUserid();
		
		if (count == 1) {
			UserVO uvo = userService.user(vo);
			session.setAttribute("userSession", uvo);
			session.setAttribute("sessionUserid", userid);
			session.setMaxInactiveInterval(1800);
			
			message = "ok";
		}
		if(logger.isInfoEnabled()) {
            logger.info("회원가입 아이디 = " + vo.getUserid() + ".");
        }
		return message;
		
	}
	
	@RequestMapping(value="/kakaoLoginForm.do")
	public String kakaoLoginForm() {
		return "kakaoLoginForm";
	}
	
	@RequestMapping(value="/kakaoLogin.do")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception{
	    String access_Token = kakaoService.getAccessToken(code);
        
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("kakaoEmail", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        System.out.println(userInfo.get("email")+"@@@@@@@@@@");
	    return "redirect:/main.do";
	}
	
	@RequestMapping(value="/kakaoLogout.do")
	public String kakaoLogout(HttpSession session) throws Exception{
		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("kakaoEmail");
	    return "redirect:/main.do";
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
	

	  @RequestMapping(value = "/sendSms.do", method = RequestMethod.POST)
	     public String sendSms(HttpServletRequest request) throws Exception {

	       String api_key = "NCSLZMWLTLAGUOJF";
	       String api_secret = "C5FY3RRIOGVJJMC65UNNGVZWMUO9VFDN";

	       Coolsms coolsms = new Coolsms(api_key, api_secret);
	       
	       HashMap<String, String> set = new HashMap<String, String>();	    
	       set.put("to", "01093231530"); // 수신번호

	       set.put("from", "01093231530"); // 발신번호
	       set.put("text", (String)request.getParameter("text")); // 문자내용
	       set.put("type", "sms"); // 문자 타입

	       System.out.println(set);
	     
	       JSONObject result = coolsms.send(set); // 보내기&전송결과받기
	       System.out.println();

	       if ((boolean)result.get("status") == true) {
	         // 메시지 보내기 성공 및 전송결과 출력
	         System.out.println("성공");
	         System.out.println(result.get("group_id")); // 그룹아이디
	         System.out.println(result.get("result_code")); // 결과코드
	         System.out.println(result.get("result_message")); // 결과 메시지
	         System.out.println(result.get("success_count")); // 메시지아이디
	         System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	       } else {
	         // 메시지 보내기 실패
	         System.out.println("실패");
	         System.out.println(result.get("code")); // REST API 에러코드
	         System.out.println(result.get("message")); // 에러메시지
	       }

	       return "sms/smsapi";
	     }
	
}
