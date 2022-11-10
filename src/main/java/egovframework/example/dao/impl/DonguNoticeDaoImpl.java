package egovframework.example.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.dao.DonguNoticeDao;
import egovframework.example.service.DonguNoticeMapper;
import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.Search;

@Repository
public class DonguNoticeDaoImpl implements DonguNoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DonguNoticeVO> donguNoticeList(Search search) throws Exception {
		DonguNoticeMapper mapper = sqlSession.getMapper(DonguNoticeMapper.class);
		return mapper.donguNoticeList(search);
	}
	
	@Override
	public int getNoticeListCnt(Search search) throws Exception {
		DonguNoticeMapper mapper = sqlSession.getMapper(DonguNoticeMapper.class);
		return mapper.getNoticeListCnt(search);
	}
	
	@Override
	public DonguNoticeVO donguNoticeDetail(int idx) {
		DonguNoticeMapper mapper = sqlSession.getMapper(DonguNoticeMapper.class);
		return mapper.donguNoticeDetail(idx);
	}
	
	@Override
	public int donguNoticeWrite(DonguNoticeVO vo) {
		DonguNoticeMapper mapper = sqlSession.getMapper(DonguNoticeMapper.class);
		return mapper.donguNoticeWrite(vo);
	}
	
	@Override
	public void noticeDelete(int idx) {
		DonguNoticeMapper mapper = sqlSession.getMapper(DonguNoticeMapper.class);
		mapper.noticeDelete(idx);
	}
	
	@Override
	public void noticeUpdate(DonguNoticeVO vo) {
		DonguNoticeMapper mapper = sqlSession.getMapper(DonguNoticeMapper.class);
		mapper.noticeUpdate(vo);
	}
}
