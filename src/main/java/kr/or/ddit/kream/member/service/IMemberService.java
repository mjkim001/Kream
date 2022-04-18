package kr.or.ddit.kream.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.kream.vo.MemberVO;
import kr.or.ddit.kream.vo.MyBuyingListVO;

public interface IMemberService {
	public int insertMember(MemberVO memberVo);
	public MemberVO getMember(MemberVO memberVo);
	public List<MyBuyingListVO> getBidList(Map<String, String> paramap);
	public Map<String, Integer> getBuySellCount(String mem_email);
}
