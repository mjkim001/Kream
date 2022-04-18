package kr.or.ddit.kream.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.kream.util.SqlMapClientFactory;
import kr.or.ddit.kream.vo.MemberVO;
import kr.or.ddit.kream.vo.NoticeVo;

public class AdminNoticeDaoImpl implements IAdminNoticeDao{
	private SqlMapClient  client ;
	private static IAdminNoticeDao dao;
	
	//생성자 - client객체 얻어오기 
	private AdminNoticeDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	//getInstance()메소드 - dao객체생성하고 리턴 
	public  static IAdminNoticeDao getInstance() {
		if(dao == null) dao = new AdminNoticeDaoImpl();
		
		return  dao;
	}

	

	@Override
	public int totalCount() throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.queryForObject("수정");
	}
	
	@Override
	public List<NoticeVo> selectList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return  client.queryForList("수정", map);
	}
}
