package egovframework.example.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.dao.DonguDao;
import egovframework.example.service.DonguMapper;
import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.DonguVO;
import egovframework.example.vo.Search;

@Repository
public class DonguDaoImpl implements DonguDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DonguVO> donguList(Search search) throws Exception {
		DonguMapper mapper = sqlSession.getMapper(DonguMapper.class);
		return mapper.donguList(search);
	}
	
	@Override
	public int getListCnt(Search search) {
		DonguMapper mapper = sqlSession.getMapper(DonguMapper.class);
		return mapper.getListCnt(search);
	}
	
	@Override
	public DonguVO donguDetail(int id) {
		DonguMapper mapper = sqlSession.getMapper(DonguMapper.class);
		return mapper.donguDetail(id);
	}

	@Override
	public List<DonguNoticeVO> getNotice() {
		DonguMapper mapper = sqlSession.getMapper(DonguMapper.class);
		return mapper.getNotice();
	}
}
