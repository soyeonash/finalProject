package com.daol.library.readingRoom.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.readingRoom.service.ReadingRoomService;

@Controller
public class ReadingRoomController {

	@Autowired
	private ReadingRoomService service;

	// 열람실 메인 화면
	@RequestMapping(value = "readingRoom.do", method = RequestMethod.GET)
	public String readingRoomView() {
		return "readingRoom/readingRoomMain";
	}

	// 좌석 현황
	@ResponseBody
	@RequestMapping(value = "printAllReadingRoom.do", method = RequestMethod.POST)
	public String printAllReadingRoom() {
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
		String strNowDate = simpleDateFormat.format(nowDate);
		List<ReadingRoom> result = service.printAllReadingRoom(strNowDate);
		Gson gson = new Gson();
		String rsvList = gson.toJson(result);
		return rsvList;
	}
	
	// 좌석 선택 후 시간 조회
	@ResponseBody
	@RequestMapping(value = "selectSeatStatus.do", method = RequestMethod.POST)
	public String selectSeatStatus(@ModelAttribute ReadingRoom readingRoom ) {
		int seatNo =Integer.parseInt(readingRoom.getSeatNo());
		List<ReadingRoom> result = service.selectSeatStatus(seatNo);
		Gson gson = new Gson();
		String rsvList = gson.toJson(result);
		return rsvList;
	}
	
	// 좌석 예약
	@ResponseBody
	@RequestMapping(value = "reservationReadingRoom.do", method = RequestMethod.POST)
	public String reservationReadingRoom(@ModelAttribute ReadingRoom readingRoom, HttpSession session) {
		String loginUser = (String)session.getAttribute("userId");
		readingRoom.setUserId(loginUser);
		int result = service.reservationReadingRoom(readingRoom);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 예약 취소
	@ResponseBody
	@RequestMapping(value="cancleReadingRoom.", method=RequestMethod.GET)
	public String cancleReadingRoom(@ModelAttribute ReadingRoom readingRoom) {
		int result = service.cancleReadingRoom(readingRoom);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
