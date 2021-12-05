package com.daol.library.studyRoom.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.studyRoom.domain.StudyRoom;
import com.daol.library.studyRoom.service.StudyRoomService;
import com.daol.library.studyRoom.store.StudyRoomStore;

@Service
public class StudyRoomServiceImpl implements StudyRoomService {

	@Autowired
	private StudyRoomStore store;

	@Override
	public int reservationStudyRoom(StudyRoom studyRoom) {
		int result = store.insertStudyRoom(studyRoom);
		return result;
	}

	@Override
	public int cancleStudyRoom(StudyRoom studyRoom) {
		int result = store.deleteStudyRoom(studyRoom);
		return result;
	}

	@Override
	public List<StudyRoom> selectTimeStatus(String rsvDate) {
		List<StudyRoom> result = store.selectTimeStatus(rsvDate);
		return result;
	}
	
}
