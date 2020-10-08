package com.company.matching;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.company.matching.model.InquiryDTO;
import com.company.matching.model.UsersDTO;
import com.company.matching.service.InquiryMapper;
import com.company.matching.service.MemberPager;
import com.company.matching.service.UsersMapper;

@Controller
public class InquiryController {
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@Autowired
	public InquiryMapper inquiryMapper;
	
	@Autowired
	public UsersMapper usersMapper;
	
	//1:1문의 작성
	@RequestMapping(value = "/insertInq.do")
	public String inqWrite(HttpServletRequest req, InquiryDTO dto, BindingResult result){
		if (result.hasErrors()) {
			dto.setInqNum(0);
		}
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(target);
			} catch (IOException e) { }
			filename = file.getOriginalFilename();
			filesize = (int)file.getSize();
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		dto.setInqContent(dto.getInqContent().replaceAll("\r\n", "<br>"));
		int res = inquiryMapper.inqWrite(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg="문의완료";
			url="inquiry.do";
		} else {
			msg="실패";
			url="inquiryForm.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//내 문의 리스트
	@RequestMapping(value = "/inquiry.do")
	public ModelAndView myInqList(HttpSession session, HttpServletRequest req,
			                @RequestParam(defaultValue="all") String searchOption, 
                            @RequestParam(defaultValue="") String keyword, 
                            @RequestParam(defaultValue="1") int curPage) {	
		
		String userEmail = (String)session.getAttribute("mbId");
		System.out.print(userEmail);
		
		//레코드 수 계산
		int count = inquiryMapper.countInquiry(searchOption, keyword, userEmail);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();		
		
		List<InquiryDTO> list = inquiryMapper.inqList(searchOption, keyword, start, end, userEmail);

		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("listInquiry", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("inquiry/inquiryList");
		
		return mav;
	}
	
	//관리자 전체 문의 리스트
	@RequestMapping(value = "/adminInquiry.do")
	public ModelAndView adminInqList(HttpSession session, HttpServletRequest req,
			                @RequestParam(defaultValue="all") String searchOption, 
                            @RequestParam(defaultValue="") String keyword, 
                            @RequestParam(defaultValue="1") int curPage,
                            @RequestParam(defaultValue="2") int inqOk) {	
				
		//레코드 수 계산
		int count = inquiryMapper.adminCountInquiry(searchOption, inqOk, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();		
		
		List<InquiryDTO> list = inquiryMapper.adminInqList(searchOption, keyword, inqOk, start, end);

		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("adminListInquiry", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("admin/adminInquiryList");
		
		return mav;
	}
	
	//내 문의내역 보기
	@RequestMapping(value = "/inqContent.do")
	public String inqContent(HttpServletRequest req, HttpSession session, int inqNum) {
		InquiryDTO dto = inquiryMapper.getInq(inqNum);
		List<UsersDTO> user = inquiryMapper.userInq(inqNum);
		req.setAttribute("userInq", user);		
		req.setAttribute("getInq", dto);	
		return "inquiry/inquiryContent";
	}
	
	//관리자가 전체 문의내역 보기
	@RequestMapping(value = "/adminInqContent.do")
	public String adminInqContent(HttpServletRequest req, HttpSession session, int inqNum) {
		InquiryDTO dto = inquiryMapper.getInq(inqNum);
		List<UsersDTO> user = inquiryMapper.userInq(inqNum);
		req.setAttribute("userInq", user);		
		req.setAttribute("getInq", dto);	
		return "inquiry/inquiryUpdateContent";
	}
	
	//답변여부
	@SuppressWarnings("unused")
	@RequestMapping(value = "/updateInq.do")
	public String updateInq(InquiryDTO dto, HttpServletRequest req) {
		int res = inquiryMapper.updateInq(dto);
		String msg = null, url = null;
		if (res > 0) {
			int up = inquiryMapper.upInqOk(dto.getInqNum());
			msg = "답변완료";
			url = "adminInquiry.do";
		} else {
			msg = "실패";
			url = "adminInqContent.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";	
	}
	
	//문의글 수정 폼
	@RequestMapping(value = "/updateContentForm.do")
	public String updateFormNotice(HttpServletRequest req, int inqNum) {
		InquiryDTO dto = inquiryMapper.getInq(inqNum);
		req.setAttribute("getInq", dto);
		return "inquiry/inquiryUpdateContent";
	}
	
	//문의글 수정 실행
	@SuppressWarnings("unused")
	@RequestMapping(value = "/updateContent.do")
	public String updateNotice(InquiryDTO dto) {
		int res = inquiryMapper.updateContent(dto);
		return "redirect:inquiry.do";
	}
	
	//문의글 삭제 실행
	@RequestMapping(value = "/deleteInq.do")
	public String deleteInq(HttpServletRequest req) {
		String inqNum = req.getParameter("inqNum");
		int res = inquiryMapper.deleteInq(Integer.parseInt(inqNum));
		String msg = null, url = null;
		if (res > 0) {
			msg = "문의삭제 성공";
			url = "inquiry.do";
		} else {
			msg = "문의삭제 실패";
			url = "inquiry.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

}
