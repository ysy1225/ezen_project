package com.company.matching;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.company.matching.model.FAQDTO;
import com.company.matching.model.UsersDTO;
import com.company.matching.service.AdminMapper;
import com.company.matching.service.InquiryMapper;
import com.company.matching.service.MemberPager;

@Controller
public class AdminController {
	
	@Autowired
	public AdminMapper adminMapper;
	
	@Autowired
	public InquiryMapper inquiryMapper;
	
	//관리자 전체 회원 리스트
	@RequestMapping(value = "/memberList.do")
	public ModelAndView memberList(@RequestParam(defaultValue="all") String searchOption, 
			                       @RequestParam(defaultValue="") String keyword, 
			                       @RequestParam(defaultValue="1") int curPage) {
		//레코드 수 계산
		int count = adminMapper.countArticle(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		
		List<UsersDTO> list = adminMapper.memberList(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("memberList", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("admin/memberList");
		
		return mav;
	}
	
	//관리자 정지 회원 리스트
	@RequestMapping(value = "/blockMemberList.do")
	public ModelAndView blockMemberList(@RequestParam(defaultValue="all") String searchOption, 
			                            @RequestParam(defaultValue="") String keyword, 
			                            @RequestParam(defaultValue="1") int curPage) {
		//레코드 수 계산
		int count = adminMapper.countBlockArticle(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		
		List<UsersDTO> list = adminMapper.blockMemberList(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("blockMemberList", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("admin/blockMemberList");
		
		return mav;
	}
	
	//회원 정지 실행
	@RequestMapping(value = "/adminBlock.do")
	public String adminBlock(HttpServletRequest req) {
		String userNum = req.getParameter("userNum");
		int res = adminMapper.adminBlock(Integer.parseInt(userNum));
		String msg = null, url = null;
		if (res > 0) {
			msg = "회원차단 성공";
			url = "memberList.do";
		} else {
			msg = "회원차단 실패";
			url = "memberList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//회원 삭제 실행
	@RequestMapping(value = "/adminDelete.do")
	public String adminDelete(HttpServletRequest req) {
		String userNum = req.getParameter("userNum");
		int res = adminMapper.adminDelete(Integer.parseInt(userNum));
		String msg = null, url = null;
		if (res > 0) {
			msg = "회원삭제 성공";
			url = "memberList.do";
		} else {
			msg = "회원삭제 실패";
			url = "memberList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//회원 정지 풀기
	@RequestMapping(value = "/adminAllow.do")
	public String adminAllow(HttpServletRequest req) {
		String userNum = req.getParameter("userNum");
		int res = adminMapper.adminAllow(Integer.parseInt(userNum));
		String msg = null, url = null;
		if (res > 0) {
			msg = "회원허용 성공";
			url = "blockMemberList.do";
		} else {
			msg = "회원허용 실패";
			url = "memberList.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//FAQ 리스트
	@RequestMapping(value = "/inquiryAdmin.do")
	public ModelAndView FAQ(@RequestParam(defaultValue="all") String searchOption, 
			                @RequestParam(defaultValue="") String keyword, 
			                @RequestParam(defaultValue="1") int curPage) {
		//레코드 수 계산
		int count = inquiryMapper.FAQCount(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		
		List<FAQDTO> list = inquiryMapper.FAQList(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("admin/FAQ");
		
		return mav;
	}
	
	//FAQ 리스트
	@RequestMapping(value = "/inquiryFAQ.do")
	public ModelAndView inquiryFAQ(@RequestParam(defaultValue="all") String searchOption, 
			                       @RequestParam(defaultValue="") String keyword, 
			                       @RequestParam(defaultValue="1") int curPage) {
		//레코드 수 계산
		int count = inquiryMapper.inquiryFAQCount(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		
		List<FAQDTO> list = inquiryMapper.inquiryFAQList(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("sub/inquiryFAQ");
		
		return mav;
	}
	
	/*//FAQ 목록
	@RequestMapping(value = "/inquiryAdmin.do")
	public String FAQ(HttpServletRequest req,
			@RequestParam(defaultValue="all") String select, 
            @RequestParam(defaultValue="") String keyword, 
            @RequestParam(defaultValue="1") int curPage) {
		
		int count = inquiryMapper.FAQCount(select, keyword);
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		List<FAQDTO> list = inquiryMapper.FAQList(select, keyword, start, end);
		
		req.setAttribute("memberPage", memberPager);
		req.setAttribute("list", list);
		req.setAttribute("select", select);
		req.setAttribute("keyword", keyword);
		req.setAttribute("count", count);
		return "admin/FAQ";
	}*/
	
	//FAQ 작성 폼
	@RequestMapping(value = "/WriteFAQ.do")
	public String WFAQ(FAQDTO dto) {
		return "admin/WriteFAQ";
	}
	
	//FAQ 작성 실행
	@RequestMapping(value = "/insertFAQ.do")
	public String insertFAQ(FAQDTO dto) {
		int res = inquiryMapper.insertFAQ(dto);
		return "redirect:inquiryAdmin.do";
	}
	
	//FAQ 글 보기
	@RequestMapping(value = "/FAQInfo.do")
	public String FAQInfo(int faqNum, HttpServletRequest req) {
		FAQDTO dto = inquiryMapper.getFaq(faqNum);
		req.setAttribute("getFaq", dto);
		return "admin/FAQInfo";
	}
	
	//FAQ 글 수정
	@RequestMapping(value = "/updateFAQ.do")
	public String updateFAQ(int faqNum, HttpServletRequest req) {
		FAQDTO dto = inquiryMapper.getFaq(faqNum);
		int res = inquiryMapper.updateFAQ(dto);
		return "admin/FAQInfo";
	}

}
