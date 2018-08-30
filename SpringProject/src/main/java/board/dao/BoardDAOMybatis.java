package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Transactional
@Component
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite", map);		
	}

	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList", map);
	}

	public int getTotalA() {
		return sqlSession.selectOne("boardSQL.getTotalA");
	}

	public List<BoardDTO> boardSearch(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.boardSearch", map);
	}

	public int getSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getSearchTotalA", map);
	}

	public BoardDTO boardView(int seq) {
		return sqlSession.selectOne("boardSQL.boardView", seq);
	}

	public void boardReply(BoardDTO boardDTO) {
		sqlSession.update("boardSQL.boardReply1", boardDTO);//step update
		sqlSession.insert("boardSQL.boardReply2", boardDTO);//insert
		sqlSession.update("boardSQL.boardReply3", boardDTO);//reply update
		
	}
	
	public void boardDelete(int seq) {
		sqlSession.delete("boardSQL.boardDelete", seq);
	}
}

//update board set step=step+1 where ref=원글ref and step>원글step
//update board set step=step+1 where ref=원글ref and step>=답글step












