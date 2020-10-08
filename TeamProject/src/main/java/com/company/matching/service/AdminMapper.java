package com.company.matching.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.UsersDTO;

@Service
public class AdminMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체 회원 리스트
	public List<UsersDTO> memberList(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("memberList", map);
	}
	
	//전체 회원 검색 레코드 수
	public int countArticle(String searchOption, String keyword) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("countArticle", map);
	}
	
	//정지 회원 리스트
	public List<UsersDTO> blockMemberList(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("blockMemberList", map);
	}
	
	//정지 회원 검색 레코드 수
	public int countBlockArticle(String searchOption, String keyword) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("countBlockArticle", map);
	}
	
	//회원 정지 warningLevel +1 올리기
	public int adminBlock(int userNum) {
		return sqlSession.update("adminBlock", userNum);
	}
	
	//회원 삭제
	public int adminDelete(int userNum) {
		return sqlSession.delete("adminDelete", userNum);
	}
	
	//회원 정지 풀기 warningLevel -1 내리기
	public int adminAllow(int userNum) {
		return sqlSession.update("adminAllow", userNum);
	}

}
