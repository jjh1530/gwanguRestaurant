package egovframework.example.service;

import egovframework.example.vo.UserVO;

public interface UserMapper {


	public int userLogin(UserVO vo);

	public UserVO user(UserVO vo);
}
