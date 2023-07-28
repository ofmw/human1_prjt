package com.omart.service.member;

import com.omart.vo.MemberVo;

public interface MemberService {

	default MemberVo login(String m_id, String m_pw) {return null;}
	default MemberVo klogin(String m_id) {return null;}
	default int join(MemberVo memberVo) {return 0;}

}
