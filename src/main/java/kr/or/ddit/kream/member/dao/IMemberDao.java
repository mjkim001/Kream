package kr.or.ddit.kream.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.kream.vo.MemberVO;
import kr.or.ddit.kream.vo.MyBuyingListVO;

public interface IMemberDao {
	public int insertMember(SqlMapClient smc, MemberVO memberVo) throws SQLException;
	public MemberVO getMember(SqlMapClient smc, MemberVO memberVo) throws SQLException;
	public List<MyBuyingListVO> getBidList(SqlMapClient smc, Map<String, String> paramap) throws SQLException;
	public Map<String, Integer> getBuySellCount(SqlMapClient smc, String mem_email) throws SQLException;
}
