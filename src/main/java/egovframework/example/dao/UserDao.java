package egovframework.example.dao;

import egovframework.example.vo.UserVO;

public interface UserDao {


	public int userLogin(UserVO vo);
	
	public UserVO user(UserVO vo);

	public int register(UserVO vo);

	public int registerCheck(String userid);

	public void imageUpdate(UserVO vo);

	public void passUpdate(UserVO vo);
}
