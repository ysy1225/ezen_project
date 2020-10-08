package com.company.matching.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.CartLectureDTO;
import com.company.matching.model.PayLectureDTO;
import com.company.matching.model.TutorDTO;
import com.company.matching.model.UsersDTO;

@Service
public class UsersMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//로그인
	public int checkLogin(LoginCheck check) {
		String dbPass = sqlSession.selectOne("checkLogin", check.getUserEmail());
		if (dbPass == null) {
			return LoginCheck.NOT_ID;
		} else if (dbPass.trim().equals(check.getUserPw1())) {
			return LoginCheck.OK;
		} else {
			return LoginCheck.NOT_PW;
		}
	}
	
	//이메일 중복체크
	public boolean check(String userEmail) {
		int check = sqlSession.selectOne("checkEmail", userEmail);
		if (check == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//이메일 중복체크 버튼
	public int idcheck(String userEmail) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("userEmail", userEmail);
		return sqlSession.selectOne("idcheck", map);
	}
	
	//회원,튜터 나누기
	public int userLevel(String userEmail, String userPw1) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("userEmail", userEmail);
		map.put("userPw1", userPw1);
		return sqlSession.selectOne("userLevel", map);
	}
	
	//이름 가져오기
	public String getName(String userEmail, String userPw1) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("userEmail", userEmail);
		map.put("userPw1", userPw1);
		return sqlSession.selectOne("getName", map);
	}
	
	//로그인 회원정보 가져오기
	public UsersDTO viewMember(UsersDTO dto) {
		return sqlSession.selectOne("viewMember", dto);
	}
	
	//정지계정
	public int blockCheck(String userEmail) {
		int cEmail = sqlSession.selectOne("checkEmail", userEmail);
		if (cEmail > 0) {
			int block = sqlSession.selectOne("blockCheck", userEmail);
			return block;
		} else {
			return 0;
		}		
	}
	
	//ID찾기
	public String searchId(String userName, String userPhone){
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("userName", userName);
		map.put("userPhone", userPhone);
		return sqlSession.selectOne("searchId", map);
	}
	
	//PW찾기
	public int searchNum(String userName, String userEmail, String userPhone) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		map.put("userPhone", userPhone);
		return sqlSession.selectOne("searchNum", map);
	}
	
	//PW재설정
	public int pwReset(String userPw1, String userPw2, int userNum) {
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("userPw1", userPw1);
		map.put("userPw2", userPw2);
		map.put("userNum", String.valueOf(userNum));
		return sqlSession.update("pwReset", map);
	}
	
	public int pwSearchCheck(String userName, String userEmail, String userPhone){
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		map.put("userPhone", userPhone);
		return sqlSession.selectOne("pwSearchCheck", map);
	}
	
	//회원가입
	public int insertUsers(UsersDTO dto) {
		return sqlSession.insert("insertUsers", dto);
	}
	
	public int getUserNum(String userEmail) {
		return sqlSession.selectOne("getUserNum", userEmail);
	}
	
	//마이페이지 비밀번호 입력 체크
	public String myPageCheck(String userEmail) {
		return sqlSession.selectOne("myPageCheck", userEmail);
	}
	
	//마이페이지 정보 가져오기
	public UsersDTO getUserPage(String userEmail) {
		return sqlSession.selectOne("getUserPage", userEmail);
	}
	
	//마이페이지 회원탈퇴
	public void deleteInfo(String userEmail, HttpSession session) {
		sqlSession.selectOne("deleteInfo", userEmail);
		session.invalidate();
	}
	
	public String getPw1(String userEmail) {
		return sqlSession.selectOne("getPw1", userEmail);
	}
	
	//마이페이지 튜터 정보 가져오기
	public List<TutorDTO> myPageTutor(int userNum) {
		return sqlSession.selectList("myPageTutor", userNum);
	}
	
	//마이페이지 신청내역
	public List<PayLectureDTO> myPageLecture(int userNum) {
		return sqlSession.selectList("myPageLecture", userNum);
	}
	
	//찜 목록 나열
	public List<CartLectureDTO> myPageCart(int userNum) {
		return sqlSession.selectList("myPageCart", userNum);
	}
	
	//폰 번호 수정
	public int updatePhone(UsersDTO dto) {
		return sqlSession.update("updatePhone", dto);
	}

}
