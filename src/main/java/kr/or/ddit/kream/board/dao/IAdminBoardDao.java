package kr.or.ddit.kream.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.kream.vo.MemberVO;

public interface IAdminBoardDao {
	//리스트 출력 
	public List<MemberVO> selectList(Map<String, Object> map) throws SQLException;
	  
	//전체 글갯수 가져오기 
	public int totalCount() throws SQLException;
}
