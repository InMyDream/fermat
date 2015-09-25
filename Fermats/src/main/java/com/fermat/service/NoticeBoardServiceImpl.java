package com.fermat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fermat.domain.NoticeBoardVO;
import com.fermat.persistence.NoticeBoardDAO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{

	@Inject
	private NoticeBoardDAO dao;
	
	@Override
	public void regist(NoticeBoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.create(board);
	}

	@Override
	public NoticeBoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public void modify(NoticeBoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.update(board);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	@Override
	public List<NoticeBoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
	
}
