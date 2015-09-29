package com.fermat.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fermat.domain.Criteria;
import com.fermat.domain.NoticeBoardVO;
import com.fermat.domain.SearchCriteria;
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
		board.setTitle("test");
		board.setContent("test");
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
		board.setTitle("update");
		board.setContent("update" );
		dao.update(board);
	}
	
	@Test
	public void dtestDelete() throws Exception{
		dao.delete(1);
	}
	
	@Test
	public void etestListPage() throws Exception{
		int page = 3;
		
		List<NoticeBoardVO> list = dao.listPage(page);
		
		for(NoticeBoardVO boardVO : list){
			logger.info(boardVO.getBno() + ":"+ boardVO.getTitle());
		}
	}
	
	@Test
	public void ftestListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(3);
		cri.setPerPageNum(10);
		
		List<NoticeBoardVO> list = dao.listCriteria(cri);
		
		for(NoticeBoardVO boardVO : list){
			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}
	}
	
	@Test
	public void gtestURI() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/noticeboard/read")
				.queryParam("bno", 12)
				.queryParam("perPageNum", 20)
				.build();
		
		logger.info("/noticeboard/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
	@Test
	public void htestDynamic1() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("±Û");
		cri.setSearchType("t");
		
		logger.info("===============================");
		
		List<NoticeBoardVO> list = dao.listSearch(cri);
		
		for(NoticeBoardVO boardVO : list){
			logger.info(boardVO.getBno()+":"+boardVO.getTitle());
		}
		
		logger.info("===============================");
		
		logger.info("COUNT: "+dao.listSearchCount(cri));
	}
}
