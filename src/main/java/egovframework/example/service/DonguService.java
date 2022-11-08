package egovframework.example.service;

import java.util.List;

import egovframework.example.vo.DonguVO;
import egovframework.example.vo.Search;

public interface DonguService {

	public List<DonguVO> donguList(Search search) throws Exception;
	
	public int getListCnt(Search search);
	
	public DonguVO donguDetail(int id); 
	
}