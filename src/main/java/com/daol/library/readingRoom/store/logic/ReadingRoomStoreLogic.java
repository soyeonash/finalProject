package com.daol.library.readingRoom.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.readingRoom.store.ReadingRoomStore;
@Repository
public class ReadingRoomStoreLogic implements ReadingRoomStore {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReadingRoom> printAllReadingRoom(String strNowDate) {
		List<ReadingRoom> result = sqlSession.selectList("readingRoomMapper.selectAllReadingRoom", strNowDate);
		return result;
	}

	@Override
	public List<ReadingRoom> selectSeatStatus(int seatNo) {
		List<ReadingRoom> result = sqlSession.selectList("readingRoomMapper.selectSeatStatus", seatNo);
		return result;
	}
	
	@Override
	public int insertReadingRoom(ReadingRoom readingRoom) {
		int result = sqlSession.insert("readingRoomMapper.insertReadingRoom", readingRoom);
		return result;
	}

	@Override
	public int deleteReadingRoom(ReadingRoom readingRoom) {
		int result = sqlSession.delete("readingRoomMapper.deleteReadingRoom", readingRoom);
		return result;
	}

}
