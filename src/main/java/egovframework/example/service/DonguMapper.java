package egovframework.example.service;

import java.util.List;


import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.DonguVO;
import egovframework.example.vo.Search;

public interface DonguMapper {

	public List<DonguVO> donguList2();
	
	public List<DonguVO> donguList(Search search) throws Exception;
	
	public int getListCnt(Search search);

	public DonguVO donguDetail(int id);	
	
	public List<DonguNoticeVO> getNotice();

	
}
