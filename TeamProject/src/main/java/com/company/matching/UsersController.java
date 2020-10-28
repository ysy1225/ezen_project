package com.company.matching;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.company.matching.model.CartLectureDTO;
import com.company.matching.model.PayLectureDTO;
import com.company.matching.model.TutorDTO;
import com.company.matching.model.UsersDTO;
import com.company.matching.service.LoginCheck;
import com.company.matching.service.TutorMapper;
import com.company.matching.service.UsersMapper;

@Controller
public class UsersController {
	
	@Autowired
	public UsersMapper usersMapper;
	
	@Autowired
	public TutorMapper tutorMapper;
	
	//로그인 실행
	@RequestMapping(value = "/loginPro.do")
	public String loginPro(HttpServletRequest req, HttpServletResponse resp, UsersDTO dto) {		
		String msg = null, url = null;
		String userEmail = req.getParameter("userEmail");
		String saveId = req.getParameter("saveId");
		LoginCheck check = new LoginCheck();
		check.setUserEmail(req.getParameter("userEmail"));
		check.setUserPw1(req.getParameter("userPw1"));
		
		int res = usersMapper.checkLogin(check);
		
		switch(res) {
		case LoginCheck.OK :
			UsersDTO dto2 = usersMapper.viewMember(dto);
			check.setUserName(usersMapper.getName(req.getParameter("userEmail"), req.getParameter("userPw1")));
			check.setUserLevel(usersMapper.userLevel(req.getParameter("userEmail"), req.getParameter("userPw1")));
			Cookie ck = new Cookie("mbId", check.getUserEmail());
			Cookie ck1 = new Cookie("getN", check.getUserName());
			Cookie ck2 = new Cookie("level", String.valueOf(check.getUserLevel()));
			if (saveId != null) {
				ck.setMaxAge(10*60);
			} else {
				ck.setMaxAge(0);
			}
			resp.addCookie(ck);
			resp.addCookie(ck1);
			resp.addCookie(ck2);
			HttpSession session = req.getSession();
			session.setAttribute("getP", dto2.getUserPhone());
			session.setAttribute("mbId", check.getUserEmail());
			session.setAttribute("getUserNum", usersMapper.getUserNum(userEmail));
			session.setAttribute("getN", check.getUserName());
			session.setAttribute("level", check.getUserLevel());
			int block = usersMapper.blockCheck(userEmail);
			if (block == 1) {
				session.invalidate();
				msg = "이용 정지된 계정입니다. 관리자에게 문의해주세요.";
				url = "mainForm.do";
			} else {			
				msg = "로그인이 되었습니다.";
				url = "mainForm.do";
			}
			if (check.getUserLevel() == 2) {
				msg = "관리자 로그인";
				url = "mainForm.do";
			}
			break;
		case LoginCheck.NOT_ID :
			msg = "없는 아이디입니다. 다시 확인하고 입력해 주세요!";
			url = "loginForm.do";
			break;
		case LoginCheck.NOT_PW :
			msg = "비밀번호가 틀렸습니다. 다시 확인하고 입력해 주세요!";
			url = "loginForm.do";
			break;
		default:
			msg = "DB서버 오류 발생! 관리자에게 문의하세요!";
			url = "mainForm.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//이메일 중복확인 체크
	@RequestMapping(value = "/idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String userEmail) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = usersMapper.idcheck(userEmail);
        map.put("cnt", count);
 
        return map;
    }

	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:mainForm.do";
	}
	
	//PW 변경으로 이동
	@RequestMapping(value = "/changePw.do")
	public String changePw(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "mypage/mapageChangPw";
	}
	
	//ID,PW 찾기로 이동
	@RequestMapping(value = "/loginSearch.do")
	public String loginSearch(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "login/loginSearch";
	}
	
	//ID,PW 찾기 실행
 	@RequestMapping(value = "/search.do")
	public String search(HttpServletRequest req, UsersDTO dto) {
		String mode = req.getParameter("mode");			
		if (mode.equals("id")) {
			String userName = req.getParameter("userName");
			String userPhone = req.getParameter("userPhone");
			String userEmail = usersMapper.searchId(userName, userPhone);
			if (userEmail == null) {
				String msg = null, url = null;
				msg = "회원정보를 찾을 수 없습니다. 다시 입력해주세요.";
				url = "loginForm.do";
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			}
			req.setAttribute("userEmail", userEmail);
		} else {
			String userName = req.getParameter("userName");
			String userEmail = req.getParameter("userEmail");
			String userPhone = req.getParameter("userPhone");
			int count = usersMapper.pwSearchCheck(userName, userEmail, userPhone);
			String msg = null, url = null;
			if (count == 0) {
				msg = "회원정보가 잘못되었습니다.";
				url = "loginForm.do";
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			} else {
				int userNum = usersMapper.searchNum(userName, userEmail, userPhone);				
				req.setAttribute("userNum", userNum);
			}
		}
		req.setAttribute("mode", mode);
		return "login/loginSearchOk";
	}
 	
	//PW 재설정
	@RequestMapping(value = "/pwReset.do")
	public String pwReset(HttpServletRequest req, HttpSession session){
		String userNum = req.getParameter("userNum");
		String userPw1 = req.getParameter("userPw1");
		String userPw2 = req.getParameter("userPw2");
		int res = usersMapper.pwReset(userPw1, userPw2, Integer.parseInt(userNum));
		String msg = null, url = null;
		if (res > 0) {
			session.invalidate();
			msg = "비밀번호 재설정 성공! 로그인페이지로 이동합니다.";
			url = "loginForm.do";			
		} else {
			msg = "비밀번호 재설정 실패! 관리자에게 문의하세요.";
			url = "mainForm.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//회원가입 실행
	@RequestMapping(value = "/insertUsers.do")
	public ModelAndView usersInsertPro(UsersDTO dto) {
		boolean check = usersMapper.check(dto.getUserEmail());
		int res = 0;
		String msg = null, url = null;
		if (check) {
			res = usersMapper.insertUsers(dto);
			if (res > 0) {
				msg = "회원가입 완료";
				url = "loginForm.do";
			} else {
				msg = "양식에 맞춰 다시 입력 부탁드립니다.";
				url = "joinForm.do";
			}
		} else {
			msg = "중복된 이메일입니다. 다시 입력 바랍니다.";
			url = "joinForm.do";
		}		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	//마이페이지 pw 확인
	@RequestMapping(value = "/myPageCheck.do")
	public String myPagecheck(HttpSession session, HttpServletRequest req) {
		String userEmail = req.getParameter("userEmail");
		req.setAttribute("userEmail", userEmail);
		return "mypage/mypageCheck";
	}
	
	// 마이페이지 진입
	@RequestMapping(value = "/myPage.do")
	public String myPage(HttpServletRequest req, HttpSession session) {
		String userEmail = (String)session.getAttribute("mbId");
		UsersDTO dto = usersMapper.getUserPage(userEmail);
		int userNum1=(Integer)session.getAttribute("getUserNum");
		int userNum = usersMapper.getUserNum(userEmail);
		List<TutorDTO> list=usersMapper.myPageTutor(userNum);
		List<TutorDTO> list2=tutorMapper.TutorList2(dto.getUserNum());		
		List<Integer> Level=tutorMapper.LevelCheck();
		req.setAttribute("mTutor", list);
		req.setAttribute("getUserPage", dto);
		req.setAttribute("levelCheck", Level);
		req.setAttribute("tutorList2", list2);
		return "mypage/mypageForm";		
	}
	
	//마이페이지 진입
	@RequestMapping(value = "/myPageOk.do")
	public String myPageForm(HttpServletRequest req) {
		String userEmail = req.getParameter("userEmail");
		String userPw1 = req.getParameter("userPw1");
		String dbPw1 = usersMapper.myPageCheck(userEmail);
		String msg = null, url = null;
		if (userPw1.equals(dbPw1)) {
			UsersDTO dto = usersMapper.getUserPage(userEmail);
			int userNum = usersMapper.getUserNum(userEmail);
			List<TutorDTO> list = usersMapper.myPageTutor(userNum);
			List<TutorDTO> list2=tutorMapper.TutorList2(dto.getUserNum());
			List<Integer> Level=tutorMapper.LevelCheck();
			req.setAttribute("mTutor", list);
			req.setAttribute("tutorList2", list2);
			req.setAttribute("levelCheck", Level);
			req.setAttribute("getUserPage", dto);
			return "mypage/mypageForm";
		} else {
			msg = "비밀번호가 틀립니다!!";
			url = "mainForm.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
	}
	
	// 마이페이지 회원 탈퇴
	@RequestMapping(value = "/myPageDelete.do")
	public String myPageDelete(HttpServletRequest req, HttpSession session) {
		return "mypage/mypageDeleteForm";
	}
	
	// 마이페이지 회원 탈퇴 처리
	@RequestMapping(value = "/myPageDeleteOk.do")
	public String myPageDeleteOk(HttpServletRequest req, HttpSession session) {
		String userEmail = (String)session.getAttribute("mbId");
		String userPw1 = req.getParameter("userPw1");
		String dbPass = usersMapper.getPw1(userEmail);
		String msg = null, url = null;
		if (userPw1.equals(dbPass)) {
			usersMapper.deleteInfo(userEmail,session);
			msg = "회원탈퇴 처리되었습니다.";
			url = "mainForm.do";	
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			url = "myPageDelete.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";		
	}
	
	// 마이페이지 강의신청내역
	@RequestMapping(value = "/myPageLecture.do")
	public String myPageLecture(HttpServletRequest req) {
		List<PayLectureDTO> list = usersMapper.myPageLecture(Integer.parseInt(req.getParameter("userNum")));
		
		req.setAttribute("list", list);
		return "mypage/mypageLecture";
	}
	
	// 마이페이지 찜목록
	@RequestMapping(value = "/myPageCart.do")
	public String myPageCart(HttpServletRequest req) {
		List<CartLectureDTO> list = usersMapper.myPageCart(Integer.parseInt(req.getParameter("userNum")));
		req.setAttribute("list", list);
		return "mypage/mypageCart";
	}
	
	//마이페이지 폰 번호 수정 폼
	@RequestMapping(value = "/Phone.do")
	public String phone(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("userNum"));
		req.setAttribute("userNum",num);
		return "mypage/updatePhone";
	}
	
	//마이페이지 폰 번호 수정
	@RequestMapping(value = "/updatePhone.do")
	public String updatePhone(UsersDTO dto, HttpServletRequest req) {
		int res = usersMapper.updatePhone(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "휴대전화 정보가 변경되었습니다.";
			url = "myPage.do";
		} else {
			msg = "휴대전화 정보 변경 실패";
			url = "myPage.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//핸드폰 번호 인증 폼
	@RequestMapping(value = "/sendSMSForm.do")
	public String sendSMSForm(HttpServletRequest req) {
		String userPhone = req.getParameter("userPhone");
		System.out.println(userPhone);
		req.setAttribute("phonenum", userPhone);
		return "join/phoneCheck";
	}
	
	//핸드폰 번호 인증
	@RequestMapping(value = "/sendSMS.do")
	public @ResponseBody String sendSMS(HttpServletRequest req) {
		String userPhone = req.getParameter("userPhone");
		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		System.out.println("수신자 번호: " + userPhone);
		System.out.println("인증 번호: " + numStr);
		req.setAttribute("phonenum", userPhone);
		certifiedPhoneNumber(userPhone, numStr);
		return numStr;
	}
	
	public void certifiedPhoneNumber(String userPhone, String cerNum) {
		String api_key = "NCSXYB2J8FBWNK6E";
		String api_secret = "AOMCCZPIZH0Q2KWYYBANN2YZN6QVKCOG";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhone);
		params.put("from", "userPhone"); //""큰따옴표 빼고 userPhone만 입력시 실제로 문자 날라감, 현재는 콘솔에서 인증번호 확인 후 실행
		params.put("type", "SMS");
		params.put("text", "이젠매칭해 휴대폰인증 테스트 메세지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
		params.put("app_version", "test app 1.2");
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

}
