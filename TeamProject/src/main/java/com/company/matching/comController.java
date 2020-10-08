package com.company.matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.matching.model.cmtDTO;
import com.company.matching.model.comDTO;
import com.company.matching.model.comGood;
import com.company.matching.model.goodBadDTO;
import com.company.matching.service.ComMapper;
import com.company.matching.service.MemberPager;

@Controller
public class comController {
	@Autowired
	public ComMapper comMapper;
	
	@RequestMapping("/community.do")
	public String community(HttpServletRequest req, HttpSession session,
			@RequestParam(defaultValue="all") String comCate,
			@RequestParam(defaultValue="all") String option,
			@RequestParam(defaultValue="") String search,
			@RequestParam(defaultValue="1") int curPage){
		
		/*String userEmail = (String)session.getAttribute("mbId");*/
		
		int count=comMapper.countCom(comCate, option, search);
		//페이지 나누기 관련 처리
				MemberPager memberPager = new MemberPager(count, curPage);
				int start = memberPager.getPageBegin();
				int end = memberPager.getPageEnd();
		List<comGood> list=comMapper.comList(comCate, option, search, start, end);
				
		req.setAttribute("count", count);
		req.setAttribute("list", list);
		req.setAttribute("page", memberPager);
		req.setAttribute("comCate", comCate);
		return "community/com";
	}
	@RequestMapping("/writeCom.do")
	public String WriteCom(){
		return "community/comInput";
	}
	@RequestMapping("insertCom.do")
	public String insertCom(comDTO dto,HttpServletRequest req,HttpSession session){
		int res=comMapper.insertCom(dto);
		return "redirect:community.do";
	}
	@RequestMapping("/communityContent.do")
	public String communityContent(int comNum,HttpServletRequest req){
		comDTO dto=comMapper.getCom(comNum);
		int gCount=comMapper.gCount(comNum);
		int bCount=comMapper.bCount(comNum);
		List<cmtDTO> comment=comMapper.comment(comNum);
		
		
		req.setAttribute("comment", comment);
		req.setAttribute("gCount", gCount);
		req.setAttribute("bCount", bCount);
		req.setAttribute("dto", dto);
		return "community/communityContent";
	}
	@RequestMapping("/updateComForm.do")
	public String updateComForm(int comNum,HttpServletRequest req){
		comDTO dto=comMapper.getCom(comNum);
		req.setAttribute("dto", dto);
		return "community/updateComForm";
	}
	@RequestMapping("/updateCom.do")
	public String updateCom(comDTO dto,HttpServletRequest req){
		int res=comMapper.updateCom(dto);
		return "redirect:community.do";
	}
	@RequestMapping("/deleteCom.do")
	public String deleteCom(int comNum,HttpServletRequest req){
		comDTO dto=comMapper.getCom(comNum);
		int res=comMapper.deleteCom(dto);
		return "redirect:community.do";
	}
	@RequestMapping("/myCom.do")
	public String myCom(int userNum,HttpServletRequest req){
		List<comDTO> dto=comMapper.myCom(userNum);
		req.setAttribute("dto", dto);
		return "community/myCom";
	}
	@RequestMapping("/goodBad.do")
	public String good(goodBadDTO dto,HttpServletRequest req,RedirectAttributes red){
		int comNum=Integer.parseInt(req.getParameter("comNum"));
		int userNum=Integer.parseInt(req.getParameter("userNum"));
		String mode=req.getParameter("gb");
		int count=comMapper.countGb(userNum, comNum);
		
		if(count == 0){
		int res=comMapper.goodBad(userNum,comNum,mode);
		}else{
			goodBadDTO gb=comMapper.getGb(userNum, comNum);
			if(gb.getGb().equals(mode)){
				int res1=comMapper.deleteGb(gb.getGbNum());
			}
		}
		red.addAttribute("comNum", comNum);
		return "redirect:communityContent.do";
	}
	@RequestMapping("/insertComment.do")
	public String insertCmt(cmtDTO dto,RedirectAttributes red){
		int res=comMapper.insertCmt(dto);
		red.addAttribute("comNum", dto.getComNum());
		return "redirect:communityContent.do";
	}
	@RequestMapping("/updateComment.do")
	public String updateComment(cmtDTO dto,RedirectAttributes red){
		int res=comMapper.updateCmt(dto);
		red.addAttribute("comNum", dto.getComNum());
		return "redirect:communityContent.do";
	}
	@RequestMapping("/deleteCmt.do")
	public String deleteCmt(int cmtNum,int comNum,RedirectAttributes red){
		int res=comMapper.deleteCmt(cmtNum);
		red.addAttribute("comNum", comNum);
		return "redirect:communityContent.do";		
	}
	
}
