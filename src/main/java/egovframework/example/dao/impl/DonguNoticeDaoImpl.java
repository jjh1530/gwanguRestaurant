package egovframework.example.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.dao.DonguNoticeDao;
import egovframework.example.service.DonguNoticeMapper;
import egovframework.example.vo.DonguNoticeVO;

@Repository
public class DonguNoticeDaoImpl implements DonguNoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DonguNoticeVO> donguNoticeList() {
		DonguNoticeMapper mapper = sqlSession.getMapper(DonguNoticeMapper.class);
		return mapper.donguNoticeList();
	}
}
