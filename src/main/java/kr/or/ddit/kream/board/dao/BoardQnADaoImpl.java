package kr.or.ddit.kream.board.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.kream.util.SqlMapClientFactory;

public class BoardQnADaoImpl implements IBoardQnADao{
	private SqlMapClient smc;
	private static IBoardQnADao dao;
	
	private BoardQnADaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IBoardQnADao getInstance() {
		if(dao==null) dao = new BoardQnADaoImpl();
		return dao;
	}
}
