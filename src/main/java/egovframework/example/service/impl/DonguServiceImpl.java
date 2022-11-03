package egovframework.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.dao.DonguDao;
import egovframework.example.service.DonguService;
import egovframework.example.vo.DonguVO;

@Service
public class DonguServiceImpl implements DonguService{

	@Autowired
	private DonguDao donguDao;
	
	@Override
	public List<DonguVO> selectTest() throws Exception {
		return donguDao.selectTest();
	}
	
}
