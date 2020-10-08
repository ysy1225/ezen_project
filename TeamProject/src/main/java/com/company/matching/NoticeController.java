package com.company.matching;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.company.matching.model.NoticeDTO;
import com.company.matching.service.MemberPager;
import com.company.matching.service.NoticeMapper;

@Controller
public class NoticeController {
	
	@Autowired
	public NoticeMapper noticeMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	//전체 공지사항 리스트
	@RequestMapping(value = "/listNotice.do")
	public ModelAndView listNotice(@RequestParam(defaultValue="all") String searchOption, 
			                       @RequestParam(defaultValue="") String keyword, 
			                       @RequestParam(defaultValue="1") int curPage) {
		//레코드 수 계산
		int count = noticeMapper.countNotice(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		
		List<NoticeDTO> list = noticeMapper.listNotice(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("listNotice", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("sub/notice");
		
		return mav;
	}
	
	//공지사항 글쓰기 실행
	@RequestMapping(value = "/insert_notice.do")
	public ModelAndView insertNotice(NoticeDTO dto){
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		int res = noticeMapper.insertNotice(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg="성공";
			url="adminListNotice.do";
		} else {
			msg="실패";
			url="adminContent_notice.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	//공지사항 글 보기
	@RequestMapping(value = "/content_notice.do")
	public String contentNotice(HttpServletRequest req, int num) {
		noticeMapper.plusReadcount(num);
		NoticeDTO dto = noticeMapper.getNotice(num);
		req.setAttribute("getNotice", dto);
		return "sub/noticeContent";	
	}
	
	//관리자 공지사항 리스트
	@RequestMapping(value = "/adminListNotice.do")
	public ModelAndView adminListNotice(@RequestParam(defaultValue="all") String searchOption, 
			                            @RequestParam(defaultValue="") String keyword, 
			                            @RequestParam(defaultValue="1") int curPage) {
		//레코드 수 계산
		int count = noticeMapper.countNotice(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();
		
		List<NoticeDTO> list = noticeMapper.listNotice(searchOption, keyword, start, end);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("listNotice", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("admin/noticeList");
		
		return mav;
	}
	
	//관리자 공지사항 글 보기
	@RequestMapping(value = "/adminContent_notice.do")
	public String adminContentNotice(HttpServletRequest req, int num) {
		noticeMapper.plusReadcount(num);
		NoticeDTO dto = noticeMapper.getNotice(num);
		req.setAttribute("getNotice", dto);
		return "admin/noticeContent";	
	}
	
	//공지사항 수정 폼
	@RequestMapping(value = "/updateForm_notice.do")
	public String updateFormNotice(HttpServletRequest req, int num) {
		NoticeDTO dto = noticeMapper.getNotice(num);
		req.setAttribute("getNotice", dto);
		return "admin/noticeUpdateForm";
	}
	
	//공지사항 수정
	@SuppressWarnings("unused")
	@RequestMapping(value = "/update_notice.do")
	public String updateNotice(NoticeDTO dto) {
		int res = noticeMapper.updateNotice(dto);
		return "redirect:adminListNotice.do";
	}
	
	//공지사항 삭제
	@SuppressWarnings("unused")
	@RequestMapping(value = "/delete_notice.do")
	public String deleteNotice(int num) {
		int res = noticeMapper.deleteNotice(num);
		return "redirect:adminListNotice.do";
	}

}