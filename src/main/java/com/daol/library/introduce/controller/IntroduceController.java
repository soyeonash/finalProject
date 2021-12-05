package com.daol.library.introduce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroduceController {

	
	@RequestMapping(value="historyView.do", method=RequestMethod.GET)
  	public String historyView() {
	  return "introduce/history"; 
  	}
	
	@RequestMapping(value="ComeView.do", method=RequestMethod.GET)
  	public String comeView() {
	  return "introduce/waytoCome"; 
  	}
	
	@RequestMapping(value="greetingView.do", method=RequestMethod.GET)
  	public String greetingView() {
	  return "introduce/greetings"; 
  	}
	
	@RequestMapping(value="informationView.do", method=RequestMethod.GET)
  	public String introduceView() {
	  return "introduce/information"; 
  	}
}
