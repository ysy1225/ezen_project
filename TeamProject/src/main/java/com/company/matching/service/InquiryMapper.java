package com.company.matching.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.FAQDTO;
import com.company.matching.model.InquiryDTO;
import com.company.matching.model.UsersDTO;

@Service
public class InquiryMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//1:1문의 작성
	public int inqWrite(InquiryDTO dto) {
		return sqlSession.insert("inqWrite", dto);
	}
	
	//내 문의 리스트
	public List<InquiryDTO> inqList(String searchOption, String keyword, int start, int end, String userEmail) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("userEmail", userEmail);
		return sqlSession.selectList("inqList", map);
	}
	
	//내 문의내역 수 카운트
	public int countInquiry(String searchOption, String keyword, String userEmail) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("userEmail", userEmail);
		return sqlSession.selectOne("countInquiry", map);
	}
	
	//1:1문의 관리자 전체 리스트
	public List<InquiryDTO> adminInqList(String searchOption, String keyword, int inqOk, int start, int end) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("inqOk", inqOk);
		return sqlSession.selectList("adminInqList", map);
	}
	
	//1:1문의 관리자 전체 문의 수 카운트
	public int adminCountInquiry(String searchOption, int inqOk, String keyword) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("inqOk", inqOk);
		return sqlSession.selectOne("adminCountInquiry", map);
	}
	
	//문의내역 보기(문의 데이터 가져오기)
	public InquiryDTO getInq(int inqNum) {
		return sqlSession.selectOne("getInq", inqNum);
	}
	
	//회원 정보 가져오기
	public List<UsersDTO> userInq(int inqNum) {
		return sqlSession.selectList("userInq", inqNum);
	}
	
	//답변 완료시 inqOk 데이터 값 1올려주기
	public int upInqOk(int inqNum) {
		return sqlSession.update("upInqOk", inqNum);
	}
	
	//답변 내용 저장하기
	public int updateInq(InquiryDTO dto) {
		return sqlSession.update("updateInq", dto);
	}
	
	//문의 수정
	public int updateContent(InquiryDTO dto) {
		return sqlSession.update("updateContent", dto);
	}
	
	//문의 삭제
	public int deleteInq(int inqNum) {
		return sqlSession.delete("deleteInq", inqNum);
	}
	
	//FAQ 리스트
	public List<FAQDTO> FAQList(String searchOption, String keyword, int start, int end) {
		java.util.Map<String, Object> map = new java.util.Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("FAQList", map);
	}
	
	//FAQ 검색 수 카운트
	public int FAQCount(String searchOption, String keyword) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("FAQCount", map);
	}
	
	//FAQ 리스트
	public List<FAQDTO> inquiryFAQList(String searchOption, String keyword, int start, int end) {
		java.util.Map<String, Object> map = new java.util.Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("inquiryFAQList", map);
	}
	
	//FAQ 검색 수 카운트
	public int inquiryFAQCount(String searchOption, String keyword) {
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("inquiryFAQCount", map);
	}
	
	//FAQ 작성
	public int insertFAQ(FAQDTO dto) {
		return sqlSession.insert("insertFAQ", dto);
	}
	
	//FAQ 데이터 가져오기
	public FAQDTO getFaq(int faqNum) {
		return sqlSession.selectOne("getFaq", faqNum);
	}
	
	//FAQ 수정
	public int updateFAQ(FAQDTO dto) {
		return sqlSession.update("updateFAQ", dto);
	}

}
