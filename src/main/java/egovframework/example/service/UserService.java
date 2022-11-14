package egovframework.example.service;

import egovframework.example.vo.UserVO;

public interface UserService {

	public int userLogin(UserVO vo);
	
	public UserVO user(UserVO vo);
	
	public int register(UserVO vo);
	
	public int registerCheck(String userid);
}
