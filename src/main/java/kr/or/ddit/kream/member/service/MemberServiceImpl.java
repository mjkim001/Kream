package kr.or.ddit.kream.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.kream.member.dao.IMemberDao;
import kr.or.ddit.kream.member.dao.MemberDaoImpl;
import kr.or.ddit.kream.util.SqlMapClientFactory;
import kr.or.ddit.kream.vo.MemberVO;
import kr.or.ddit.kream.vo.MyBuyingListVO;

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

	@Override
	public List<MyBuyingListVO> getBidList(Map<String, String> paramap) {
		List<MyBuyingListVO> list = null;
		try {
			list = dao.getBidList(smc, paramap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Map<String, Integer> getBuySellCount(String mem_email) {
		Map<String, Integer> map = null;
		
		try {
			map = dao.getBuySellCount(smc, mem_email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			map = null;
			e.printStackTrace();
		}
		
		return map;
	}

}
