package com.company.matching;

import java.text.DateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.matching.model.LectureDTO;
import com.company.matching.model.TutorDTO;
import com.company.matching.model.best;
import com.company.matching.model.lectutrev;
import com.company.matching.model.live;
import com.company.matching.service.LectureMapper;
import com.company.matching.service.TutorMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	public TutorMapper tutorMapper;
	
	@Autowired
	public LectureMapper lectureMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		return "redirect:mainForm.do";
	}
	
	//메인
	@RequestMapping(value = "/mainForm.do")
	public String mainForm(HttpServletRequest req) {
		/*List<LectureDTO> New = lectureMapper.New();
		List<live> live = lectureMapper.live();*/
		List<lectutrev> rowPrice = lectureMapper.rowPrice();
		List<best> best = lectureMapper.best();
		List<lectutrev> lectutrev = lectureMapper.lectutrev();
		
		/*req.setAttribute("New", New);
		req.setAttribute("live", live);*/
		req.setAttribute("rowPrice", rowPrice);
		req.setAttribute("best", best);
		req.setAttribute("lectutrev", lectutrev);
		
		return "main/index";
	}
	
	//로그인 폼
	@RequestMapping(value = "/loginForm.do")
	public String loginForm() {
		return "login/loginForm";
	}
	
	//회원가입 폼
	@RequestMapping(value = "/joinForm.do")
	public String joinForm() {
		String userPhone = req.getParameter("userPhone");
		req.setAttribute("phonenum", userPhone);
		return "join/joinForm";
	}
	
	//튜터등록 폼
	@RequestMapping(value = "/tutorForm.do")
	public String tutorForm() {
		/*int userNum = (Integer)session.getAttribute("getUserNum");
		int tutorLevel = tutorMapper.getTutorLevel(userNum);
		req.setAttribute("tutorLevel", tutorLevel);*/
		return "sub/tutor";
	}
	
	//팝업 폼
	@RequestMapping(value = "/popupForm.do")
	public String popupForm() {
		return "admin/popup";
	}
	
	//공지사항 글쓰기 폼
	@RequestMapping(value = "/noticeForm.do")
	public String noticeForm() {
		return "admin/noticeForm";
	}
	
	//1:1문의 글쓰기 폼
	@RequestMapping(value = "/inquiryForm.do")
	public String inquiryForm() {
		return "inquiry/inquiryForm";
	}
	
}
