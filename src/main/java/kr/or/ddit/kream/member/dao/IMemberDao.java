package kr.or.ddit.kream.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.kream.vo.MemberVO;

public interface IMemberDao {
	public int insertMember(SqlMapClient smc, MemberVO memberVo) throws SQLException;
	public MemberVO getMember(SqlMapClient smc, MemberVO memberVo) throws SQLException;
}
