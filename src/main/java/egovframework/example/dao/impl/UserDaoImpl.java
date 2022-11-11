package egovframework.example.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.dao.UserDao;
import egovframework.example.service.UserMapper;
import egovframework.example.vo.UserVO;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int userLogin(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.userLogin(vo);
	}
	
	@Override
	public UserVO user(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.user(vo);
	}
}
