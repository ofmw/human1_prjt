package com.omart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.omart.service.member.MemberService;
import com.omart.service.product.ProductService;

import lombok.Setter;
import oracle.jdbc.proxy.annotation.Post;

@RestController
@RequestMapping("/product")
public class AjaxMypageController {
	
	@Setter(onMethod_={ @Autowired })
	private MemberService mWish;
	
//	@PostMapping("/d")
}
