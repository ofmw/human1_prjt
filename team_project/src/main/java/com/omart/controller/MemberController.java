package com.omart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.omart.service.member.MemberService;
import com.omart.sms.SmsCertifiedService;
import com.omart.vo.MemberVo;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mJoin, mCancel, mWish;
	
	@Autowired
    private SmsCertifiedService sms;
	
	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "member/join";
	}	

	@PostMapping("/join_process.do")
	@ResponseBody
	public String join_process(MemberVo memberVo){
		
		System.out.println(memberVo.getM_name());

		int result = mJoin.join(memberVo);
		
		if(result == 1) {
			return "success";
		}else {
			return "fail";
		}
		
		 
	}

	@PostMapping("/checkSelNum")
	@CrossOrigin(origins = "http://localhost:9090")
	@ResponseBody
	public String checkSelNum(@RequestParam("selNum") String selNum) {
		boolean isDuplicateBySelNum = mJoin.checkDuplicateSelNum(selNum);
		if(isDuplicateBySelNum) {
			return "duplicate";
		} else {
			return "available";
		}
	} 
	
	@PostMapping("/checkId")
	@CrossOrigin(origins = "http://localhost:9090")
	@ResponseBody
	public String checkId(@RequestParam("m_id") String m_id) {
		boolean isDuplicateById = mJoin.checkDuplicateId(m_id);
		if(isDuplicateById) {
			return "duplicate";
		} else {
			return "available";
		}
	}
	
	
	//문자인증
	@RequestMapping(value = "/selNumCheck", method = RequestMethod.GET)
    @ResponseBody
    public String sendSMS(@RequestParam("selNum") String userSelNum) {
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000); // 난수 생성

        sms.certifiedSelNum(userSelNum, randomNumber);

        return Integer.toString(randomNumber);
    }
	
}
