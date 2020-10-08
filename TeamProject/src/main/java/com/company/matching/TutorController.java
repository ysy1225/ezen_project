package com.company.matching;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.company.matching.model.TutorDTO;
import com.company.matching.service.MemberPager;
import com.company.matching.service.TutorMapper;

@Controller
public class TutorController {
	
	@Resource(name = "upLoadPath")
	private String upLoadPath;
	
	@Autowired
	public TutorMapper tutorMapper;
	
	//튜터등록 폼
	@RequestMapping(value = "/tutorInputForm.do")
	public String tutorInputForm() {
		return "tutor/tutorForm";
	}
	
	//튜터등록 실행
	@RequestMapping(value = "/insert_tutor.do")
	public ModelAndView TutorInput(HttpServletRequest req, TutorDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setTutorNum(0);
		}
		String filename_face = "";
		int filesize_face = 0;
		MultipartHttpServletRequest mr1 = (MultipartHttpServletRequest)req;
		MultipartFile file1 = mr1.getFile("filename_face");
		File target1 = new File(upLoadPath, file1.getOriginalFilename());
		if (file1.getSize() > 0) {
			try {
				file1.transferTo(target1);
			} catch (IOException e) {}
			filename_face = file1.getOriginalFilename();
			filesize_face = (int)file1.getSize();
		}
		
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(target);
			} catch (IOException e) {}
			filename = file.getOriginalFilename();
			filesize = (int)file.getSize();
		}
		dto.setFilename_face(filename_face);
		dto.setFilesize_face(filesize_face);
		
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
		dto.setTutorContent(dto.getTutorContent().replaceAll("\r\n", "<br>"));
		int res = tutorMapper.insertTutor(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "튜터등록성공!관리자 검토 후 완료됩니다.";
			url = "mainForm.do";
		} else {
			msg = "실패!";
			url = "tutorInputForm.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("upLoadPath", upLoadPath);
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	//(관리자) 튜터 회원 리스트
	@RequestMapping(value = "/tutorList.do")
	public ModelAndView tutorList(@RequestParam(defaultValue="all") String searchOption, 
			                      @RequestParam(defaultValue="") String keyword, 
			                      @RequestParam(defaultValue="1") int curPage) {
		
		//레코드 수 계산
		int count = tutorMapper.countTutorArticle(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		
		List<TutorDTO> list = tutorMapper.tutorList(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("tutorList", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("tutor/tutorList");
		
		return mav;
	}
	
	//튜터 회원 정보 보기
	@RequestMapping(value = "/tutorContent.do")
	public String tutorContent(HttpServletRequest req, int tutorNum, HttpServletResponse resp) throws Exception {
		TutorDTO dto = tutorMapper.getTutor(tutorNum);
		String name = tutorMapper.getTutorName(tutorNum);
		String Email = tutorMapper.getTutorEmail(tutorNum);
		
		req.setAttribute("Email", Email);
		req.setAttribute("getTutor", dto);
		req.setAttribute("name", name);
		return "tutor/tutorContent";
	}
	
	@RequestMapping(value = "/deleteTutor.do")
	public String deleteTutor(int tutorNum) {
		int res = tutorMapper.deleteTutor(tutorNum);
		return "redirect:myPage.do";
	}
	
	//튜터 승인
	@RequestMapping(value = "/userLevelUp.do")
	public String userLevelUp(HttpServletRequest req, int tutorNum) {
		int res = tutorMapper.userLevelUp(tutorNum);
		int res1 = tutorMapper.tutorUp(tutorNum);
		String msg = null, url = null;
		if (res > 0 && res1 > 0) {
			msg = "승인 완료";
			url = "tutorList.do";
		} else {
			msg = "승인 거절";
			url = "tutorList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);		
		return "message";
	}
	
	//튜터 거절
	@SuppressWarnings("unused")
	@RequestMapping(value = "/not.do")
	public String tutorNot(HttpServletRequest req, String tutorContent,int tutorNum){
		int res = tutorMapper.tutorNot(tutorContent,tutorNum);
		String msg = null, url = null;
		if (res > 0) {
			//int res1 = tutorMapper.tutorDown(dto.getTutorNum());
			msg = "거절 완료";
			url = "tutorList.do";
		} else {
			msg = "거절 오류";
			url = "tutorList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);		
		return "message";
	}
	
	//거절사유 폼
	@RequestMapping(value = "/rejectForm.do")
	public String rejectForm(int tutorNum,HttpServletRequest req) {
		TutorDTO dto=tutorMapper.getTutor(tutorNum);
		req.setAttribute("getTutor", dto);
		return "tutor/tutorReject";
	}
	
	//마이페이지 튜터 분야 추가 폼
	@RequestMapping(value = "/updateTmajor.do")
	public String updateForm() {
		return "tutor/tutorUpdateTmajor";
	}
	
	//마이페이지 튜터 분야 추가 실행
	@RequestMapping(value = "/updateTutor.do")
	public String updateTutor(HttpServletRequest req) {
		int tutorNum = Integer.parseInt(req.getParameter("tutorNum"));
		TutorDTO dto = tutorMapper.getTutor(tutorNum);
		String msg = null, url = null;
		if (dto.getTutorMajor().contains(req.getParameter("tutorMajor"))) {
			msg = "중복";
			url = "myPage.do";
		} else {
			String tutorMajor = dto.getTutorMajor() + "," + req.getParameter("tutorMajor");
			int res = tutorMapper.updateTutor(tutorMajor, tutorNum);		
			if (res > 0) {
				msg = "성공!";
				url = "myPage.do";
			} else {
				msg = "실패!";
				url = "myPage.do";
			}
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);		
		return "message";		
	}

}
