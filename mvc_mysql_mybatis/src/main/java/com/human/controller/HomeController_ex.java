package com.human.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
/* @Controller */
/* @RequestMapping("/member") - 요청정보의 경로가 member까지 동일한 경우 /member로 경로지정*/
public class HomeController_ex {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController_ex.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/* @RequestMapping(value = "/", method = RequestMethod.GET) - 기존방식*/
	@GetMapping("/") /* 새로운방식 */
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";/* 뷰의 이름 */
	}
	
}
