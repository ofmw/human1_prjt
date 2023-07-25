package com.human.service.member;

import com.human.vo.MemberVo;

public interface MemberService {

	default int join(MemberVo memberVo) {return 0;}

}
