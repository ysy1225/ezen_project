package com.company.matching.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.TutorDTO;

@Service
public class TutorMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//튜터등록
	public int insertTutor(TutorDTO dto) {
		return sqlSession.insert("insertTutor", dto);
	}
	
	//튜터 회원 리스트
	public List<TutorDTO> tutorList(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("tutorList", map);
	}
	
	//튜터 회원 검색 레코드 수
	public int countTutorArticle(String searchOption, String keyword) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("countTutorArticle", map);
	}
	
	//튜터 정보 가져오기
	public TutorDTO getTutor(int tutorNum) {
		return sqlSession.selectOne("getTutor", tutorNum);
	}
	public TutorDTO getTutorInfo(int userNum) {
		return sqlSession.selectOne("getTutorInfo", userNum);
	}	
	public String getTutorName(int tutorNum) {
		return sqlSession.selectOne("getTutorName", tutorNum);
	}	
	public String getTutorEmail(int tutorNum) {
		return sqlSession.selectOne("getTutorEmail", tutorNum);
	}
	
	//튜터로 전환
	public int userLevelUp(int tutorNum) {
		return sqlSession.update("userLevelUp", tutorNum);
	}
	
	//튜터 승인
	public int tutorUp(int tutorNum) {
		return sqlSession.update("tutorUp", tutorNum);
	}
	
	//튜터 거절 메시지
	public int tutorNot(String tutorContent,int tutorNum) {
		java.util.Map<String,Object> map=new java.util.Hashtable<String,Object>();
		map.put("tutorContent", tutorContent);
		map.put("tutorNum", tutorNum);
		return sqlSession.update("tutorNot", map);
	}
	
	//튜터 거절
	public int tutorDown(int tutorNum) {
		return sqlSession.update("tutorDown", tutorNum);
	}
	
	//튜터 전공 값 가져오기
	public String getMajor(int userNum) {
		return sqlSession.selectOne("getMajor", userNum);
	}
	
	//튜터 마이페이지에서 분야 추가하기
	public int updateTutor(String tutorMajor, int tutorNum) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("tutorMajor", tutorMajor);
		map.put("tutorNum", String.valueOf(tutorNum));
		return sqlSession.update("updateTmajor", map);
	}
	
	public List<TutorDTO> TutorList2(int userNum) {
		return sqlSession.selectList("tutorList2", userNum);
	}
	
	public List<Integer> LevelCheck() {		 
		return sqlSession.selectList("LevelCheck");
	}
	
	public int deleteTutor(int tutorNum) {
		return sqlSession.delete("deleteTutor", tutorNum);
	}
	
	/*public int getTutorLevel(int userNum) {
		return sqlSession.selectOne("getTutorLevel", userNum);
	}*/

}
