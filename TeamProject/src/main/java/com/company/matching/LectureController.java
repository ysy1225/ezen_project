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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.matching.model.CartDTO;
import com.company.matching.model.LectureDTO;
import com.company.matching.model.PayDTO;
import com.company.matching.model.ReviewDTO;
import com.company.matching.model.ReviewUser;
import com.company.matching.model.TutorDTO;
import com.company.matching.model.UsersDTO;
import com.company.matching.model.lectut;
import com.company.matching.model.lectutrev;
import com.company.matching.service.LectureMapper;
import com.company.matching.service.MemberPager;
import com.company.matching.service.ReviewMapper;
import com.company.matching.service.TutorMapper;
import com.company.matching.service.UsersMapper;

@Controller
public class LectureController {
	
	@Resource(name = "upLoadPath")
	private String upLoadPath;
	
	@Autowired
	public LectureMapper lectureMapper;
	
	@Autowired
	public UsersMapper usersMapper;
	
	@Autowired
	public TutorMapper tutorMapper;
	
	@Autowired
	public ReviewMapper reviewMapper;
	
	//강의등록 폼
	@RequestMapping(value = "/lectureInput.do")
	public String lectureInput(HttpServletRequest req, HttpSession session){
		String email = (String)session.getAttribute("mbId");
		int userNum = usersMapper.getUserNum(email);
		String major = tutorMapper.getMajor(userNum);
		req.setAttribute("major", major);	
		return "lecture/lectureForm";
	}
	
	//강의등록 실행
	@RequestMapping(value = "/lectureInput_Ok.do")
	public ModelAndView lectureInputOk(HttpServletRequest req, LectureDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setLectureNum(0);
		}
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> files = mr.getFiles("filename");		
		
		for (int i = 0; i < files.size(); i++) {
			File target = new File(upLoadPath + "lecture", files.get(i).getOriginalFilename());
		
			if (files.get(i).getSize() > 0) {
				try {
					files.get(i).transferTo(target);
				} catch (IOException e) {}
				filename = filename + files.get(i).getOriginalFilename() + ",";
				filesize = filesize + (int)files.get(i).getSize();
		    }
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		int res = lectureMapper.lectureInput(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "강의등록성공!";
			url = "mainForm.do";
		} else {
			msg = "실패!";
			url = "mainForm.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("upLoadPath", upLoadPath + "lecture");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	//내 강의목록 리스트
	@RequestMapping(value = "/lectureList.do")
	public ModelAndView myLectureList(HttpSession session, HttpServletRequest req,
			                @RequestParam(defaultValue="all") String searchOption, 
                            @RequestParam(defaultValue="") String keyword, 
                            @RequestParam(defaultValue="1") int curPage) {	
		
		String email = (String)session.getAttribute("mbId");
		System.out.print(email);
		
		//레코드 수 계산
		int count = lectureMapper.countLecture(searchOption, keyword, email);
		
		//페이지 나누기 관련 처리
		MemberPager memberPager = new MemberPager(count, curPage);
		int start = memberPager.getPageBegin();
		int end = memberPager.getPageEnd();		
		
		List<LectureDTO> list = lectureMapper.lectureList(searchOption, keyword, start, end, email);

		//데이터를 맵에 저장
		Map<String, Object> map = new Hashtable<String, Object>();
		map.put("listLecture", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("memberPager", memberPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("lecture/lectureList");
		
		return mav;
	}
	
	//강의 보기
	@RequestMapping(value = "/lectureInfo.do")
	public String lectureInfo(HttpServletRequest req, HttpSession session) {
		String lectureNum = req.getParameter("lectureNum");
		LectureDTO dto = lectureMapper.lectureInfo(Integer.parseInt(lectureNum));
		TutorDTO dto1 = tutorMapper.getTutorInfo(dto.getUserNum());
		String date1 = lectureMapper.date1Form(Integer.parseInt(lectureNum));
		int count2 = lectureMapper.dateCount(Integer.parseInt(lectureNum));
		
		req.setAttribute("dto", dto);
		req.setAttribute("dto1", dto1);
		req.setAttribute("date1", date1);
		req.setAttribute("count2", count2);
		
		if(dto.getDate2() != null) {
			String date2 = lectureMapper.date2Form(Integer.parseInt(lectureNum));
			req.setAttribute("date2", date2);
		}
		if(dto.getDate3() != null) {
			String date3 = lectureMapper.date3Form(Integer.parseInt(lectureNum));
			req.setAttribute("date3", date3);
		}
		int hour = lectureMapper.hourMinus(dto);
		int checkReview = reviewMapper.checkStar(Integer.parseInt(lectureNum));
		if (checkReview != 0) {
			double avgStar = reviewMapper.avgStar(Integer.parseInt(lectureNum));		
			req.setAttribute("avgStar", avgStar);
		}
		//--------------review page----------------//
				String pageNum = req.getParameter("pageNum");
				if (pageNum==null){
					pageNum = "1";
				}
				int pageSize = 5;
				int currentPage = Integer.parseInt(pageNum);
				int startRow = currentPage * pageSize - (pageSize-1);
				int endRow = currentPage * pageSize;
				int count = reviewMapper.checkStar(Integer.parseInt(lectureNum));
				if (endRow>count) endRow = count;
				
				List<ReviewUser> review = reviewMapper.review(Integer.parseInt(lectureNum),startRow,endRow);
				req.setAttribute("review", review);
				int startNum = count - ((currentPage-1) * pageSize); 
				if (count>0){
					int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
					int pageBlock = 3;
					int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
					int endPage = startPage + pageBlock - 1;
					if (endPage>pageCount) endPage = pageCount;
					req.setAttribute("count", count);
					req.setAttribute("startNum", startNum);
					req.setAttribute("pageCount", pageCount);
					req.setAttribute("pageBlock", pageBlock);
					req.setAttribute("startPage", startPage);
					req.setAttribute("endPage", endPage);
					req.setAttribute("pageNum",pageNum);
				}
				//---------------------------//
		String mbId=(String)session.getAttribute("mbId");
		if (mbId != null) {
			int userNum = (Integer)session.getAttribute("getUserNum");		
		  	int userRev = reviewMapper.userRev(userNum, Integer.parseInt(lectureNum));
		  	int URP = reviewMapper.URP(Integer.parseInt(lectureNum), userNum);
		
		  	req.setAttribute("URP", URP);
		  	req.setAttribute("userRev", userRev);
		}
		req.setAttribute("hour", hour);
		return "lecture/lectureContent";
	}
	
	//분야별 강의목록 리스트
    @RequestMapping(value = "/lectureAllList.do")
	public String lectureAllList(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		String loc1 = req.getParameter("loc1");
		String loc2 = req.getParameter("loc2");
		if (loc1 == null || loc1.equals("선택")) {
			loc1="";
		}
		if (loc2 == null || loc2.equals("선택")) {
			loc2="";
		}
		List<lectutrev> list = lectureMapper.lectureAllList(mode,loc1,loc2);
		int count = lectureMapper.lectureAllCount(mode,loc1,loc2);
		if (list != null) {
		  req.setAttribute("lectureAllList", list);
		}
		req.setAttribute("mode", mode);
		req.setAttribute("count", count);
		return "sub/lectureAllList";
	}
    
    //분야별 강의목록 검색
	@RequestMapping(value = "/lectureFind.do")
	public String lectureFind(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		String location1 = req.getParameter("location1");
		String location2 = req.getParameter("location2");
		
		List<LectureDTO> list = lectureMapper.lectureFind(mode, location1, location2);
		int count = lectureMapper.lectureFindCount(mode, location1, location2);
		req.setAttribute("mode", mode);
		req.setAttribute("lectureList", list);
		req.setAttribute("count", count);
		return "sub/lectureAllList";		
	}
	
	//카카오 결제
	@RequestMapping(value = "/lectureKakao.do")
	public String lectureKakao(HttpSession session, HttpServletRequest req) {
		String name = (String)session.getAttribute("getN");
		String email = (String)session.getAttribute("mbId");
		int payPrice = Integer.parseInt(req.getParameter("payPrice"));
		int lectureNum = Integer.parseInt(req.getParameter("lectureNum"));
		String time= req.getParameter("time");
		
		req.setAttribute("name", name);
		req.setAttribute("email", email);
		req.setAttribute("payPrice", payPrice);
		req.setAttribute("lectureNum", lectureNum);
		req.setAttribute("time", time);
		return "lecture/lectureKakao";
	}
	
	//다날 결제
	@RequestMapping(value = "/lectureInicis.do")
	public String lectureInicis(HttpSession session, HttpServletRequest req) {
		String name = (String)session.getAttribute("getN");
		String email = (String)session.getAttribute("mbId");
		int payPrice = Integer.parseInt(req.getParameter("payPrice"));
		int lectureNum = Integer.parseInt(req.getParameter("lectureNum"));
		String time = req.getParameter("time");
		
		req.setAttribute("name", name);
		req.setAttribute("email", email);
		req.setAttribute("payPrice", payPrice);
		req.setAttribute("lectureNum", lectureNum);
		req.setAttribute("time", time);
		return "lecture/lectureInicis";
	}
	
	//결제 완료
	@SuppressWarnings("unused")
	@RequestMapping(value = "/payOk.do")
	public String payOk(HttpSession session, HttpServletRequest req) {
		String userEmail = (String)session.getAttribute("mbId");
		UsersDTO usersDTO = usersMapper.getUserPage(userEmail);
		int lectureNum = Integer.parseInt(req.getParameter("lectureNum"));
		int payPrice = Integer.parseInt(req.getParameter("payPrice"));
		int time = Integer.parseInt(req.getParameter("time"));
		
		int res = lectureMapper.lecturePay(usersDTO.getUserNum(),lectureNum,payPrice,time);
		PayDTO payDTO = lectureMapper.payInfo(usersDTO.getUserNum(),lectureNum);
		LectureDTO lectureDTO = lectureMapper.lectureInfo(lectureNum);
		req.setAttribute("usersDTO", usersDTO);
		req.setAttribute("payDTO", payDTO);
		req.setAttribute("lectureDTO", lectureDTO);
		return "lecture/lecturePayOk";
	}
	
	//강의결제 폼
	@RequestMapping(value = "/payApply.do")
	public String payApply(HttpServletRequest req) {
		String lectureNum = req.getParameter("lectureNum");
		LectureDTO dto = lectureMapper.lectureInfo(Integer.parseInt(lectureNum));
		TutorDTO dto1 = tutorMapper.getTutorInfo(dto.getUserNum());
		String date1 = lectureMapper.date1Form(Integer.parseInt(lectureNum));
		
		req.setAttribute("dto", dto);
		req.setAttribute("dto1", dto1);
		req.setAttribute("date1", date1);
		
		if(dto.getDate2() != null) {
			String date2 = lectureMapper.date2Form(Integer.parseInt(lectureNum));
			req.setAttribute("date2", date2);
		}
		if(dto.getDate3() != null) {
			String date3 = lectureMapper.date3Form(Integer.parseInt(lectureNum));
			req.setAttribute("date3", date3);
		}
		int hour = lectureMapper.hourMinus(dto);
		int checkReview = reviewMapper.checkStar(Integer.parseInt(lectureNum));
		if (checkReview != 0) {
			double avgStar = reviewMapper.avgStar(Integer.parseInt(lectureNum));		
			req.setAttribute("avgStar", avgStar);
		}		
		req.setAttribute("hour", hour);
		return "lecture/lectureApply";
	}
	
	//(결제한 회원만)리뷰 작성
	@SuppressWarnings("unused")
	@RequestMapping(value = "/revInput.do")
	public String revInput(HttpServletRequest req, ReviewDTO dto1, RedirectAttributes red){
		int res = reviewMapper.revInput(dto1);
		int lecNum = Integer.parseInt(req.getParameter("lectureNum"));
		red.addAttribute("lectureNum",lecNum);
		return "redirect:lectureInfo.do";
	}
	
	//찜 목록 추가
	@RequestMapping(value = "/cartInput.do")
	public String cartInput(HttpServletRequest req, CartDTO dto, HttpSession session) {
		int userNum = (Integer)session.getAttribute("getUserNum");
		dto.setUserNum(userNum);
		int count = lectureMapper.cartOverlap(dto);
		String msg = null, url = "lectureInfo.do?lectureNum="+dto.getLectureNum();
		if (count == 1) {
			msg = "이미 등록되어 있습니다.";
		} else if (count == 0) {
			int res = lectureMapper.cartInput(dto);
			if (res > 0) {
				msg = "성공";
			} else {
				msg = "실패";
			}
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
	}
	
	//강의 수정 폼
	@RequestMapping(value = "/lectureUpdate.do")
	public String lectureUpdate( HttpServletRequest req) {
		LectureDTO dto = lectureMapper.lectureInfo(Integer.parseInt(req.getParameter("lectureNum")));
		req.setAttribute("dto", dto);
		return "lecture/lectureUpdate";
	}
	
	//강의수정 실행
	@RequestMapping("lectureUpdate_Ok.do")
	public String lectureUpdateOk(HttpServletRequest req,LectureDTO dto,BindingResult result) {
		int res1 = lectureMapper.lectureDelete(dto.getLectureNum()); // 지우고
	if (result.hasErrors()){
		dto.setLectureNum(dto.getLectureNum());
	}
	String filename = "";
	int filesize = 0;
	MultipartHttpServletRequest mr = 
			(MultipartHttpServletRequest)req;
	List<MultipartFile> files = mr.getFiles("filename");
	
	
	for(int i=0; i<files.size(); i++) {
	File target = new File(upLoadPath+"lecture", files.get(i).getOriginalFilename());
	if (files.get(i).getSize() > 0){
		try{
			files.get(i).transferTo(target);
		}catch(IOException e){}
		filename = filename+files.get(i).getOriginalFilename()+"/";
		filesize = filesize+(int)files.get(i).getSize();
	}
	}
	
		if(!filename.equals("")) {
			String str = req.getParameter("pFile");
			String [] splitStr = str.split("/");
			
			for(int i=0;i<splitStr.length;i++){
				
				new File(upLoadPath+"lecture/"+splitStr[i]).delete();
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
		}
		else{
			//사진 수정안하면 원래 사진 다시 넣기
			dto.setFilename(req.getParameter("pFile"));
			dto.setFilesize(Integer.parseInt(req.getParameter("pFileSize")));
		}
		int res = lectureMapper.lectureUpdate(dto); // 다시 넣기
		
		String msg = null, url = null;
		if(res > 0){
			msg = "수정 성공";
			url = "mainForm.do";
		}else{
			msg = "수정 실패";
			url = "mainForm.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "message";
	}
	
	//강의종료 실행
	@RequestMapping(value = "/lectureClose.do")
	public String lectureDelete(HttpServletRequest req) {
		LectureDTO dto = lectureMapper.lectureInfo(Integer.parseInt(req.getParameter("lectureNum")));
		int check = 0;
		List<PayDTO> dto1 = null;
		if(dto.getDate3() != null){
			check = lectureMapper.lectureTimeCheck(dto.getDate3(),dto.getLectureNum());
			if(check != 1) {
				dto1 = lectureMapper.lectureUser3Check(dto.getLectureNum());
			}
		}else{
			if(dto.getDate2()!=null){
				check = lectureMapper.lectureTimeCheck(dto.getDate2(),dto.getLectureNum());
				if(check != 1) {
					dto1 = lectureMapper.lectureUser2Check(dto.getLectureNum());
				}
			}else{
				check = lectureMapper.lectureTimeCheck(dto.getDate1(),dto.getLectureNum());
				if(check != 1) {
					dto1 = lectureMapper.lectureUser1Check(dto.getLectureNum());
				}
			}
		}
		String msg = null,url = null;
		if(dto1 != null) {
			msg = "수강대기중인 회원이 있습니다.";
			url = "lectureInfo.do?lectureNum="+dto.getLectureNum();
		}else{
			int res = lectureMapper.lectureClose(dto.getLectureNum());
			msg = "수정되었습니다.";
			url = "lectureInfo.do?lectureNum="+dto.getLectureNum();
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
	}
	
	//강의 다시 열기
	@RequestMapping(value ="/lectureOpen.do")
	public String lectureOpen(HttpServletRequest req) {
		int lectureNum = Integer.parseInt(req.getParameter("lectureNum"));
		
		String msg = "시간표를 업데이트 해주세요.";
		String url = "lectureUpdate.do?lectureNum="+lectureNum;

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//리뷰 수정 폼
	@RequestMapping(value = "/updateRevForm.do")
	public String updateRevForm(HttpServletRequest req, int revNum) {
		ReviewDTO dto = lectureMapper.getReview(revNum);
		req.setAttribute("rev", dto);
		return "lecture/updateReview";
	}
	
	//리뷰 수정
	@RequestMapping(value = "/updateRev.do")
	public String updateRev(HttpServletRequest req, RedirectAttributes red, ReviewDTO dto) {
		int res = lectureMapper.updateRev(dto);	
		int lectureNum = Integer.parseInt(req.getParameter("lectureNum"));
		red.addAttribute("lectureNum", lectureNum);
		return "redirect:lectureInfo.do";
	}
	
	//리뷰 삭제
	@RequestMapping("/deleteRev.do")
	public String deleteRev(HttpServletRequest req, RedirectAttributes red) {
		int revNum = Integer.parseInt(req.getParameter("revNum"));
		int res = lectureMapper.deleteRev(revNum);
		int lectureNum = Integer.parseInt(req.getParameter("lectureNum"));
		
		red.addAttribute("lectureNum", lectureNum);
		return "redirect:lectureInfo.do";
	}
    
}
