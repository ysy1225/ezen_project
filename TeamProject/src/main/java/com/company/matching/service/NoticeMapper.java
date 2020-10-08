package com.company.matching.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.NoticeDTO;

@Service
public class NoticeMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 글쓰기
	public int insertNotice(NoticeDTO dto) {		
		return sqlSession.insert("insertNotice", dto);
	}
	
	//전체 공지사항 리스트
	public List<NoticeDTO> listNotice(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("listNotice", map);
	}
	
	//전체 공지사항 검색 레코드 수
	public int countNotice(String searchOption, String keyword) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("countNotice", map);
	}
	
	//공지사항 데이터 값 가져오기
	public NoticeDTO getNotice(int num) {
		return sqlSession.selectOne("getNotice", num);
	}
	
	//조회수
	public int plusReadcount(int num) {
		return sqlSession.update("plusReadCount", num);
	}
	
	//공지사항 수정
	public int updateNotice(NoticeDTO dto) {
		return sqlSession.update("updateNotice", dto);
	}
	
	//공지사항 삭제
	public int deleteNotice(int num) {
		return sqlSession.delete("deleteNotice", num);
	}

}