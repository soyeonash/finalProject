package com.daol.library.post.store;

import java.util.List;

import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.PostReport;
import com.daol.library.post.domain.Reply;
import com.daol.library.post.domain.ReplyReport;

public interface PostStore {

	public int selectListCount();
	public List<Post> selectPrintAll(PageInfo pi);
	public int updateReadCount(int postNo);
	public Post selectPrintOne(int postNo);
	public int insertPost(Post post);
	public int updatePost(Post post);
	public int deletePost(int postNo);
	
	public List<Post> selectAllReply(int postNo);
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(Reply reply);
	
	public PostReport selectPostReport(int postNo);
	public int insertReportPost(int postNo);
	public ReplyReport selectReplyReport(int replyNo);
	public int insertReportReply(int replyNo);
}
