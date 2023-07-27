package com.omart.service.member;

import com.omart.vo.MemberVo;

public interface MemberService {

	default MemberVo login(String member_id, String member_pw) {return null;}
	default MemberVo klogin(String member_id) {return null;}

}
