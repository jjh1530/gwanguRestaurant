package egovframework.example.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.dao.UserDao;
import egovframework.example.service.UserService;
import egovframework.example.vo.UserVO;

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
}
