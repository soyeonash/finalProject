package com.daol.library.studyRoom.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.studyRoom.domain.StudyRoom;
import com.daol.library.studyRoom.store.StudyRoomStore;

@Repository
public class StudyRoomStoreLogic implements StudyRoomStore {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertStudyRoom(StudyRoom studyRoom) {
		int result = sqlSession.insert("studyRoomMapper.insertStudyRoom", studyRoom);
		return result;
	}

	@Override
	public List<StudyRoom> selectTimeStatus(String rsvDate) {
		List<StudyRoom> result = sqlSession.selectList("studyRoomMapper.selectStudyRoom", rsvDate);
		return result;
	}
	
	@Override
	public int deleteStudyRoom(StudyRoom studyRoom) {
		int result = sqlSession.delete("studyRoomMapper.deleteStudyRoom", studyRoom);
		return result;
	}

}
