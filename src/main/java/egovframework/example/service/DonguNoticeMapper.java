package egovframework.example.service;

import java.util.List;

import egovframework.example.vo.DonguNoticeVO;
import egovframework.example.vo.Search;

public interface DonguNoticeMapper {

	public List<DonguNoticeVO> donguNoticeList(Search search) throws Exception;
	
	public int getNoticeListCnt(Search search) throws Exception;
	
	public DonguNoticeVO donguNoticeDetail(int idx);

	public int donguNoticeWrite(DonguNoticeVO vo);

}
