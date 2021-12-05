package com.daol.library.notice.service;

import java.util.List;

import com.daol.library.notice.domain.Notice;
import com.daol.library.notice.domain.PageInfo;

public interface NoticeService {

	public List<Notice> printAll(PageInfo pi);

	public int registerNotice(Notice notice);

	public int getListCount();

	public Notice printOne(int boardNo);

	public void countUp(int noticeNo);

	public int deleteNotice(int noticeNo);

	public Notice updateOne(int noticeNo);

	public int updateNotice(Notice notice);

}
