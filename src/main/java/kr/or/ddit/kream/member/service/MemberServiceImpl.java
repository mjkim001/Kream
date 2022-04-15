package kr.or.ddit.kream.member.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.kream.member.dao.IMemberDao;
import kr.or.ddit.kream.member.dao.MemberDaoImpl;
import kr.or.ddit.kream.util.SqlMapClientFactory;
import kr.or.ddit.kream.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private static IMemberService service;
	private IMemberDao dao;
	private SqlMapClient smc;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public int insertMember(MemberVO memberVo){
		int res = 0;
		try {
			res = dao.insertMember(smc, memberVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			res = 0;
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public MemberVO getMember(MemberVO memberVo) {
		MemberVO vo = null;
		try {
			vo = dao.getMember(smc, memberVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

}
