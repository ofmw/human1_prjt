package com.human.service.member;

import com.human.vo.MemberVo;

public interface MemberService {

	default int join(MemberVo memberVo) {return 0;}
	default int checkId(String member_id) {return 0;}
	default MemberVo login(String member_id, String member_pw) {return null;}
	default MemberVo update(MemberVo memberVo) {return null;}
	default int cancel(int member_idx) {return 0;}
	
}
