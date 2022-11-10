package egovframework.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.dao.DonguNoticeDao;
import egovframework.example.service.DonguNoticeService;
import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.Search;

@Service
public class DonguNoticeServiceImpl implements DonguNoticeService{

	@Autowired
	private DonguNoticeDao donguNoticeDao;
	
	@Override
	public List<DonguNoticeVO> donguNoticeList(Search search) throws Exception {
		return donguNoticeDao.donguNoticeList(search);
	}
	
	@Override
	public int getNoticeListCnt(Search search) throws Exception {
		return donguNoticeDao.getNoticeListCnt(search);
	}
	
	@Override
	public DonguNoticeVO donguNoticeDetail(int idx) {
		return donguNoticeDao.donguNoticeDetail(idx);
	}
	
	@Override
	public int donguNoticeWrite(DonguNoticeVO vo) {
		return donguNoticeDao.donguNoticeWrite(vo);
	}
	
	@Override
	public void noticeDelete(int idx) {
		donguNoticeDao.noticeDelete(idx);
	}
	
	@Override
	public void noticeUpdate(DonguNoticeVO vo) {
		donguNoticeDao.noticeUpdate(vo);
	}
	
}
