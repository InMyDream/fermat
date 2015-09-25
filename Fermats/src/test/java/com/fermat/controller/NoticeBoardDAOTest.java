package com.fermat.controller;

import javax.inject.Inject;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fermat.domain.NoticeBoardVO;
import com.fermat.persistence.NoticeBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class NoticeBoardDAOTest {
	
	@Inject
	private NoticeBoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(NoticeBoardDAOTest.class);
	
	@Test
	public void atestCreate() throws Exception{
		NoticeBoardVO board = new NoticeBoardVO();
		board.setTitle("새로운 글을 넣습니다 ");
		board.setContent("새로운 글을 넣습니다 ");
		board.setWriter("user00");
		dao.create(board);
	}
	
	@Test
	public void btestRead() throws Exception{
		logger.info(dao.read(1).toString());
	}
	
	@Test
	public void ctestUpdate() throws Exception{
		NoticeBoardVO board = new NoticeBoardVO();
		board.setBno(1);
		board.setTitle("수정된 글입니다 ");
		board.setContent("수정 테스트" );
		dao.update(board);
	}
	
	@Test
	public void dtestDelete() throws Exception{
		dao.delete(1);
	}
}
