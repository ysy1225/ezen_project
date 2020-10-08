package com.company.matching.service;

import java.sql.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.CartDTO;
import com.company.matching.model.LectureDTO;
import com.company.matching.model.PayDTO;
import com.company.matching.model.ReviewDTO;
import com.company.matching.model.best;
import com.company.matching.model.bestlive;
import com.company.matching.model.lectut;
import com.company.matching.model.lectutrev;
import com.company.matching.model.live;

@Service
public class LectureMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//강의 등록
	public int lectureInput(LectureDTO dto) {
		return sqlSession.insert("lectureInput", dto);
	}
	
	//내 강의목록
	public List<LectureDTO> lectureList(String searchOption, String keyword, int start, int end, String email) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("mbId", email);
		return sqlSession.selectList("lectureList", map);
	}
	
	//내 강의목록 카운트
	public int countLecture(String searchOption, String keyword, String email) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("mbId", email);
		return sqlSession.selectOne("countLecture", map);
	}
	
	//강의 보기(날짜1,날짜2,날짜3,시간 형식에 맞게 출력)
	public LectureDTO lectureInfo(int lectureNum) {
		return sqlSession.selectOne("lectureInfo", lectureNum);
	}	
	public String date1Form(int lectureNum) {
		return sqlSession.selectOne("date1Form", lectureNum);
	}
	public String date2Form(int lectureNum) {
		return sqlSession.selectOne("date2Form", lectureNum);
	}
	public String date3Form(int lectureNum) {
		return sqlSession.selectOne("date3Form", lectureNum);
	}
	public int hourMinus(LectureDTO dto) {
		return sqlSession.selectOne("hourMinus", dto);
	}
	
	//분야별 강의목록 리스트
	public List<lectutrev> lectureAllList(String mainCate, String loc1, String loc2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("mainCate", mainCate);
		map.put("loc1", loc1);
		map.put("loc2", loc2);
		return sqlSession.selectList("lectureAllList", map);
	}
	
	//분야별 강의목록 카운트
	public int lectureAllCount(String mainCate, String loc1, String loc2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("mainCate", mainCate);
		map.put("loc1", loc1);
		map.put("loc2", loc2);
		return sqlSession.selectOne("lectureAllCount", map);
	}
	
	//분야별 강의목록 검색
	public List<LectureDTO> lectureFind(String mainCate, String location1, String location2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("mainCate", mainCate);
		map.put("location1", location1);
		map.put("location2", location2);
		return sqlSession.selectList("lectureFind", map);
	}
	
	//분야별 강의목록 검색 카운트
	public int lectureFindCount(String mainCate, String location1, String location2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("mainCate", mainCate);
		map.put("location1", location1);
		map.put("location2", location2);
		return sqlSession.selectOne("lectureFindCount", map);
	}
	
	public int lecturePay(int userNum, int lectureNum, int payPrice, int time) {
		java.util.Map<String, Integer> map = new java.util.Hashtable<String, Integer>();
		map.put("userNum", userNum);
		map.put("lectureNum", lectureNum);
		map.put("payPrice", payPrice);
		map.put("time", time);		
		return sqlSession.insert("lecturePay", map);
	}
	
	public PayDTO payInfo(int userNum, int lectureNum) {
		java.util.Map<String, Integer> map = new java.util.Hashtable<String, Integer>();
		map.put("userNum", userNum);
		map.put("lectureNum", lectureNum);
		return sqlSession.selectOne("payInfo", map);
	}
	
	public int dateCount(int lectureNum) {
		return sqlSession.selectOne("dateCount", lectureNum);
	}
	
	/*public List<LectureDTO> New() {
		return sqlSession.selectList("New");
	}
	
	public List<live> live() {
		return sqlSession.selectList("live");
	}*/
	
	//만원 이하 클래스 순 나열
	public List<lectutrev> rowPrice() {
		return sqlSession.selectList("rowPrice");
	}
	
	//메인페이지 평점 순 나열
	public List<best> best() {
		return sqlSession.selectList("best");
	}
	
	//메인페이지 최근등록 순 나열
	public List<lectutrev> lectutrev() {
		return sqlSession.selectList("lectutrev");
	}
	
	//찜 목록 추가
	public int cartInput(CartDTO dto) {
		return sqlSession.insert("cartInput", dto);
	}
	
	//찜 중복 방지
	public int cartOverlap(CartDTO dto) {
		return sqlSession.selectOne("cartOverlap", dto);
	}
	
	//리뷰 데이터 가져오기
	public ReviewDTO getReview(int revNum) {
		return sqlSession.selectOne("getRev", revNum);
	}
	
	//리뷰 수정
	public int updateRev(ReviewDTO dto) {
		return sqlSession.update("updateRev", dto);
	}
	
	//리뷰 삭제
	public int deleteRev(int revNum) {
		return sqlSession.delete("deleteRev", revNum);
	}
	
	//강의 수정
	public int lectureDelete(int lectureNum) {
		return sqlSession.delete("lectureDelete", lectureNum);
	}
	public int lectureUpdate(LectureDTO dto) {
		return sqlSession.insert("lectureUpdate", dto);
	}
	
	//강의 종료 전 남아 있는 수업 체크
	public int lectureTimeCheck(Date date, int lectureNum) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("date", date);
		map.put("lectureNum", lectureNum);
		return sqlSession.selectOne("lectureTimeCheck",map);
	}
	
	//수강 예정중인 인원 체크
	public List<PayDTO> lectureUser3Check(int lectureNum){
		return sqlSession.selectList("lectureUser3Check",lectureNum);
	}
	public List<PayDTO> lectureUser2Check(int lectureNum){
		return sqlSession.selectList("lectureUser2Check",lectureNum);
	}
	public List<PayDTO> lectureUser1Check(int lectureNum){
		return sqlSession.selectList("lectureUser1Check",lectureNum);
	}
	
	//강의 종료 실행
	public int lectureClose(int lectureNum) {
		return sqlSession.update("lectureClose", lectureNum);
	}
	
	//회원번호로 강의종료(탈퇴 시)
	public int lectureCloseU(int userNum) {
		return sqlSession.update("lectureCloseU", userNum);
	}

}
