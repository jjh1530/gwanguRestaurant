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
	
	@Override
	public int register(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.register(vo);
	}
	
	@Override
	public int registerCheck(String userid) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.registerCheck(userid);
	}
	
	@Override
	public void imageUpdate(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.imageUpdate(vo);
	}
	
	@Override
	public void passUpdate(UserVO vo) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.passUpdate(vo);	
	}
}
