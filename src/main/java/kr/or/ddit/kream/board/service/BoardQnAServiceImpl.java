package kr.or.ddit.kream.board.service;

import kr.or.ddit.kream.board.dao.BoardQnADaoImpl;
import kr.or.ddit.kream.board.dao.IBoardQnADao;

public class BoardQnAServiceImpl implements IBoardQnAService {
	private static IBoardQnADao dao;
	private static IBoardQnAService service;
	
	private BoardQnAServiceImpl() {
		dao = BoardQnADaoImpl.getInstance();
	}

	public static IBoardQnAService getInstance() {
		if(service == null) service = BoardQnAServiceImpl.getInstance();
		return service;
	}
}
