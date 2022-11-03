package egovframework.example.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.dao.DonguDao;
import egovframework.example.service.DonguMapper;
import egovframework.example.vo.DonguVO;

@Repository
public class DonguDaoImpl implements DonguDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DonguVO> selectTest() throws Exception {
		DonguMapper mapper = sqlSession.getMapper(DonguMapper.class);
		return mapper.selectTest();
	}
}
