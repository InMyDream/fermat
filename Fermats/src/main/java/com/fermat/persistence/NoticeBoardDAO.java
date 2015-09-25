package com.fermat.persistence;

import java.util.List;

import com.fermat.domain.Criteria;
import com.fermat.domain.NoticeBoardVO;

public interface NoticeBoardDAO {
	
	public void create(NoticeBoardVO vo) throws Exception;
	
	public NoticeBoardVO read(Integer bno) throws Exception;
	
	public void update(NoticeBoardVO vo) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public List<NoticeBoardVO> listAll() throws Exception;
	
	//페이지를 인자로 넘기면 그 페이지에 해당하는 목록을 보여줌
	public List<NoticeBoardVO> listPage(int page) throws Exception;
	
	public List<NoticeBoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;

}
