package egovframework.example.dao;

import egovframework.example.vo.UserVO;

public interface UserDao {


	public int userLogin(UserVO vo);
	
	public UserVO user(UserVO vo);
}
