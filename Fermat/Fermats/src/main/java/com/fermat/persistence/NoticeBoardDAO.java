package com.fermat.persistence;

import java.util.List;

import com.fermat.domain.NoticeBoardVO;

public interface NoticeBoardDAO {
	
	public void create(NoticeBoardVO vo) throws Exception;
	
	public NoticeBoardVO read(Integer bno) throws Exception;
	
	public void update(NoticeBoardVO vo) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public List<NoticeBoardVO> listAll() throws Exception;

}
