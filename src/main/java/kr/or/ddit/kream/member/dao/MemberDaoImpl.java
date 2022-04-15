package kr.or.ddit.kream.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.kream.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao{
	private static IMemberDao dao;
	private MemberDaoImpl() {
		
	}
	public static IMemberDao getInstance() {
		if(dao==null)dao = new MemberDaoImpl();
		return dao;
	}
	

	@Override
	public int insertMember(SqlMapClient smc,  MemberVO memberVo) throws SQLException {
		Object obj = smc.insert("member.insertMember", memberVo);
		if(obj == null) return 1;
		else return 0;
	}
	@Override
	public MemberVO getMember(SqlMapClient smc, MemberVO memberVo) throws SQLException {
		
		return (MemberVO)smc.queryForObject("member.getMember", memberVo);
	}

}
