package com.company.matching.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.matching.model.cmtDTO;
import com.company.matching.model.comDTO;
import com.company.matching.model.comGood;
import com.company.matching.model.goodBadDTO;

@Service
public class ComMapper {
	@Autowired
	private SqlSession sqlSession;
	
	
	public int insertCom(comDTO dto){
		return sqlSession.insert("insertCom",dto);
	}
	public List<comGood> comList(String comCate, String option, String search, int start, int end){
		java.util.Map<String,Object> map=new java.util.HashMap<String,Object>();
		map.put("comCate", comCate);
		map.put("option", option);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("comList",map);
	}
	public int countCom(String comCate, String option, String search){
		java.util.Map<String,Object> map=new java.util.HashMap<String,Object>();
		map.put("comCate", comCate);
		map.put("option", option);
		map.put("search", search);
		return sqlSession.selectOne("countCom",map);
	}
	public comDTO getCom(int comNum){
		return sqlSession.selectOne("getCom",comNum);
	}
	public int updateCom(comDTO dto){
		return sqlSession.update("updateCom",dto);
	}
	public int deleteCom(comDTO dto){
		return sqlSession.delete("deleteCom",dto);
	}
	public List<comDTO> myCom(int userNum){
		return sqlSession.selectList("myCom",userNum);
	}
	public int goodBad(int userNum,int comNum,String gb){
		java.util.Map<String,Object> map=new java.util.Hashtable<String,Object>();
		map.put("userNum", userNum);
		map.put("comNum", comNum);
		map.put("gb", gb);
		return sqlSession.insert("good",map);
	}
	public int countGb(int userNum,int comNum){
		java.util.Map<String,Object> map=new java.util.Hashtable<String,Object>();
		map.put("userNum", userNum);
		map.put("comNum", comNum);
		return sqlSession.selectOne("checkGb",map);
	}
	public int deleteGb(int gbNum){
		return sqlSession.delete("deleteGb",gbNum);
	}
	public goodBadDTO getGb(int userNum,int comNum){
		java.util.Map<String,Object> map=new java.util.Hashtable<String,Object>();
		map.put("userNum", userNum);
		map.put("comNum", comNum);
		return sqlSession.selectOne("getGb",map);
	}
	public int gCount(int comNum){
		return sqlSession.selectOne("gCount",comNum);
	}
	public int bCount(int comNum){
		return sqlSession.selectOne("bCount",comNum);
	}
	public int insertCmt(cmtDTO dto){
		return sqlSession.insert("insertCmt",dto);
	}
	public List<cmtDTO> comment(int comNum){
		return sqlSession.selectList("comment",comNum);
	}
	public int updateCmt(cmtDTO dto){
		return sqlSession.update("updateCmt",dto);
	}
	public int deleteCmt(int cmtNum){
		return sqlSession.delete("deleteCmt",cmtNum);
	}
}
