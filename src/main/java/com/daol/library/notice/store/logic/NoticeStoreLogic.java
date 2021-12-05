package com.daol.library.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.notice.domain.Notice;
import com.daol.library.notice.domain.PageInfo;
import com.daol.library.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Notice> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Notice> nList = sqlSession.selectList("noticeMapper.selectNoticeList", pi, rowBounds);
		return nList;
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("noticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("noticeMapper.selectListCount");
		return count;
	
	}

	@Override
	public Notice printOne(int noticeNo) {
		Notice notice = sqlSession.selectOne("noticeMapper.selectOnenotice", noticeNo);
		return notice;
	}

	@Override
	public void viewCount(int noticeNo) {
		sqlSession.update("noticeMapper.updateCount", noticeNo);
		
	}

	@Override
	public int removeNotice(int noticeNo) {
		int result = sqlSession.delete("noticeMapper.deleteOneNotice", noticeNo);
		return result;
	}

	@Override
	public Notice updateView(int noticeNo) {
		Notice notice = sqlSession.selectOne("noticeMapper.selectOnenotice", noticeNo);
		return notice;
	}

	@Override
	public int updateOne(Notice notice) {
		int result = sqlSession.update("noticeMapper.updateOneNotice", notice);
		return result;
	}
}
