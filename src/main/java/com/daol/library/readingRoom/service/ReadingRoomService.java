package com.daol.library.readingRoom.service;

import java.util.List;

import com.daol.library.readingRoom.domain.ReadingRoom;

public interface ReadingRoomService {

	// 열람실 현황
	public List<ReadingRoom> printAllReadingRoom(String strNowDate);
	// 열람실 예약
	public int reservationReadingRoom(ReadingRoom readingRoom);
	// 열람실 예약 취소
	public int cancleReadingRoom(ReadingRoom readingRoom);
	// 좌석 선택 후 시간 선택
	public List<ReadingRoom> selectSeatStatus(int seatNo);
	
}
