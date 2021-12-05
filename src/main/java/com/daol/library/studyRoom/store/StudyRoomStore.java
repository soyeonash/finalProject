package com.daol.library.studyRoom.store;

import java.util.List;

import com.daol.library.studyRoom.domain.StudyRoom;

public interface StudyRoomStore {

	// 스터디룸 예약
	public int insertStudyRoom(StudyRoom studyRoom);
	// 스터디룸 예약 취소
	public int deleteStudyRoom(StudyRoom studyRoom);
	// 날짜 선택 후 예약 시간 조회
	public List<StudyRoom> selectTimeStatus(String rsvDate);
}
