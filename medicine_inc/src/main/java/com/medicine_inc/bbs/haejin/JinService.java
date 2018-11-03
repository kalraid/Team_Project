package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.medicine_inc.bbs.domain.GuestReply;
import com.medicine_inc.bbs.domain.Hospital;
import com.medicine_inc.bbs.domain.Pharmacy;

public interface JinService {

	public abstract List<Pharmacy> radiansList(String lat, String lng);
	public abstract List<Hospital> radiansListHospital(String lat, String lng);
	
	public abstract Pharmacy getPharmacy(String no);
	public abstract Hospital getHospital(String no);
	
	//댓글
	public abstract void setGReply(GuestReply reply);
	public abstract List<GuestReply> greplyList(int bno, int btype);
	public boolean greplyPassCheck(int no, int pass);
	public void deletegReply(int no);
	public void reUpdate(GuestReply reply);
	
	//검색리스트 + 페이징
	public abstract Map<String, Object> pSearchList(String sidoname, String name, int pageNum);
	public abstract Map<String, Object> aniSearchList(String sidoname, String name, int pageNum);
	//public abstract int pgetListCount(String sidoname, String name);
	public abstract Map<String, Object> hosSearchList(String sidoname, String name, int pageNum, String clcdname, String classification);
}
