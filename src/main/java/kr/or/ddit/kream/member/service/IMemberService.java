package kr.or.ddit.kream.member.service;

import kr.or.ddit.kream.vo.MemberVO;

public interface IMemberService {
	public int insertMember(MemberVO memberVo);
	public MemberVO getMember(MemberVO memberVo);
}
