package com.daol.library.studyRoom.service;

import java.util.List;

import com.daol.library.studyRoom.domain.StudyRoom;

public interface StudyRoomService {
	
	// 스터디룸 예약
	public int reservationStudyRoom(StudyRoom studyRoom);
	// 스터디룸 예약 취소
	public int cancleStudyRoom(StudyRoom studyRoom);
	// 날짜 선택 후 시간 선택
	public List<StudyRoom> selectTimeStatus(String rsvDate);
}
