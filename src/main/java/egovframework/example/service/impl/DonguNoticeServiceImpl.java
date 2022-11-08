package egovframework.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.dao.DonguNoticeDao;
import egovframework.example.service.DonguNoticeService;
import egovframework.example.vo.DonguNoticeVO;

@Service
public class DonguNoticeServiceImpl implements DonguNoticeService{

	@Autowired
	private DonguNoticeDao donguNoticeDao;
	
	@Override
	public List<DonguNoticeVO> donguNoticeList() {
		return donguNoticeDao.donguNoticeList();
	}
}
