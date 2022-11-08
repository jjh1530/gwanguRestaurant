package egovframework.example.dao;

import java.util.List;

import egovframework.example.vo.DonguVO;
import egovframework.example.vo.Search;

public interface DonguDao {

	public List<DonguVO> donguList(Search search) throws Exception;
	
	public int getListCnt(Search search);

	public DonguVO donguDetail(int id);
}
