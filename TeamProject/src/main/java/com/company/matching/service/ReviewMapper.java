package com.company.matching.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.ReviewDTO;
import com.company.matching.model.ReviewUser;

@Service
public class ReviewMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int revInput(ReviewDTO dto) {
		return sqlSession.insert("revInput", dto);
	}
	
	public List<ReviewUser> review(int lectureNum, int start, int end) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("lectureNum", String.valueOf(lectureNum));
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		return sqlSession.selectList("reviewList", map);
	}
	
	public double avgStar(int lectureNum) {
		return sqlSession.selectOne("avgStar", lectureNum);
	}
	
	public int checkStar(int lectureNum) {
		return sqlSession.selectOne("checkStar", lectureNum);
	}
	
	public int userRev(int userNum, int lectureNum) {
		java.util.Map<String, String> map = new java.util.HashMap<String, String>();
		map.put("userNum", String.valueOf(userNum));
		map.put("lectureNum", String.valueOf(lectureNum));
		return sqlSession.selectOne("userRev", map);
	}
	
	public Integer URP(int lectureNum, int userNum) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("lectureNum", String.valueOf(lectureNum));
		map.put("userNum", String.valueOf(userNum));
		return sqlSession.selectOne("URP", map);
	}

}
