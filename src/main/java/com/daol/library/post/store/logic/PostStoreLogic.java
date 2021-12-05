package com.daol.library.post.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.post.domain.PageInfo;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.PostReport;
import com.daol.library.post.domain.Reply;
import com.daol.library.post.domain.ReplyReport;
import com.daol.library.post.store.PostStore;

@Repository
public class PostStoreLogic implements PostStore{
	
	@Autowired
	private SqlSession session;

	@Override
	public int selectListCount() {
		int totalCount = session.selectOne("postMapper.selectCount");
		return totalCount;
	}

	@Override
	public List<Post> selectPrintAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		List<Post> pList = session.selectList("postMapper.selectListAll",pi, rowBounds);
		return pList;
	}

	@Override
	public int updateReadCount(int postNo) {
		int result = session.update("postMapper.updateReadCount",postNo);
		return result;
	}

	@Override
	public Post selectPrintOne(int postNo) {
		Post post = session.selectOne("postMapper.selectOnePost",postNo);
		return post;
	}

	@Override
	public int insertPost(Post post) {
		int result = session.insert("postMapper.insertPost",post);
		return result;
	}

	@Override
	public int updatePost(Post post) {
		int result = session.update("postMapper.updatePost",post);
		return result;
	}

	@Override
	public int deletePost(int postNo) {
		int result = session.delete("postMapper.deletePost",postNo);
		return result;
	}

	@Override
	public List<Post> selectAllReply(int postNo) {
		List<Post> pList = session.selectList("postMapper.selectAllReply",postNo);
		return pList;
	}

	@Override
	public int insertReply(Reply reply) {
		int result = session.insert("postMapper.insertReply",reply);
		return result;
	}

	@Override
	public int updateReply(Reply reply) {
		int result = session.update("postMapper.updateReply",reply);
		return result;
	}

	@Override
	public int deleteReply(Reply reply) {
		int result = session.delete("postMapper.deleteReply",reply);
		return result;
	}

	@Override
	public PostReport selectPostReport(int postNo) {
		return session.selectOne("postMapper.selectPostReport",postNo);
	}

	@Override
	public int insertReportPost(int postNo) {
		return session.insert("postMapper.insertPostReport",postNo);
	}

	@Override
	public ReplyReport selectReplyReport(int replyNo) {
		return session.selectOne("postMapper.selectReplyReport",replyNo);
	}

	@Override
	public int insertReportReply(int replyNo) {
		return session.insert("postMapper.insertReplyReport",replyNo);
	}
	
	
}
