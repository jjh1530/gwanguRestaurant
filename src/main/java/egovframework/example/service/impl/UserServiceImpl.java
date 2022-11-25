package egovframework.example.service.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import egovframework.example.dao.UserDao;
import egovframework.example.service.UserService;
import egovframework.example.vo.UserVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public int userLogin(UserVO vo) {
		return userDao.userLogin(vo);
	}
	
	@Override
	public UserVO user(UserVO vo) {
		return userDao.user(vo);
	}
	
	@Override
	public int register(UserVO vo) {
		return userDao.register(vo);
	}
	
	@Override
	public int registerCheck(String userid) {
		return userDao.registerCheck(userid);
	}
	
	@Override
	public void imageUpdate(UserVO vo) {
		userDao.imageUpdate(vo);
	}
	
	@Override
	public void passUpdate(UserVO vo) {
		userDao.passUpdate(vo);
	}
	
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSLZMWLTLAGUOJF";
	    String api_secret = "C5FY3RRIOGVJJMC65UNNGVZWMUO9VFDN";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01093231530");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}
}
