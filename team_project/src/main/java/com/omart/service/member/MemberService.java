package com.omart.service.member;

import com.omart.vo.MemberVo;

public interface MemberService {

	default int join(MemberVo memberVo) {return 0;}

}
