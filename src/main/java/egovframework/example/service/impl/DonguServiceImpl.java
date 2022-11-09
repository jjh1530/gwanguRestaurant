package egovframework.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.dao.DonguDao;
import egovframework.example.service.DonguService;
import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.DonguVO;
import egovframework.example.vo.Search;

@Service
public class DonguServiceImpl implements DonguService{

	@Autowired
	private DonguDao donguDao;
	
	@Override
	public List<DonguVO> donguList(Search search) throws Exception {
		return donguDao.donguList(search);
	}
	
	@Override
	public int getListCnt(Search search) {
		return donguDao.getListCnt(search);
	}

	@Override
	public DonguVO donguDetail(int id) {
		return donguDao.donguDetail(id);
	}

	@Override
	public List<DonguNoticeVO> getNotice() {
		donguDao.getNotice();
		return donguDao.getNotice();
	}
}
