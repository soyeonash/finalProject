package com.daol.library.studyRoom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daol.library.studyRoom.domain.StudyRoom;
import com.daol.library.studyRoom.service.StudyRoomService;
import com.google.gson.Gson;

@Controller
public class StudyRoomController {

	@Autowired
	private StudyRoomService service;

	// 스터디룸 메인 화면
	@RequestMapping(value = "studyRoom.do", method = RequestMethod.GET)
	public String readingRoomView() {
		return "studyRoom/studyRoomMain";
	}

	// 스터디룸 예약
	@ResponseBody
	@RequestMapping(value = "reservationStudyRoom.do", method = RequestMethod.POST)
	public String reservationStudyRoom(@ModelAttribute StudyRoom studyRoom, HttpSession session) {
		String loginUser = (String) session.getAttribute("userId");
		studyRoom.setUserId(loginUser);
		int result = service.reservationStudyRoom(studyRoom);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 날짜 선택 후 예약 시간 조회
	@ResponseBody
	@RequestMapping(value = "selectTimeStatus.do", method = RequestMethod.POST)
	public String selectTimeStatus(@ModelAttribute StudyRoom studyRoom ) {
	String rsvDate = studyRoom.getsReservationDate();
	List<StudyRoom> result = service.selectTimeStatus(rsvDate); 
	Gson gson = new Gson(); 
	String rsvList = gson.toJson(result);
	return rsvList; 
	}
	 
	// 예약 취소
	@ResponseBody
	@RequestMapping(value = "cancleStudyRoom.", method = RequestMethod.GET)
	public String cancleStudyRoom(@ModelAttribute StudyRoom studyRoom) {
		int result = service.cancleStudyRoom(studyRoom);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
}
