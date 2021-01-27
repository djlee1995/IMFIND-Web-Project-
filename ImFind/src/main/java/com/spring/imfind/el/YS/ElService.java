package com.spring.imfind.el.YS;
import java.util.List;
import com.spring.imfind.el.EJ.PayVO;
public interface ElService {
	List<ElVO> getElsedata(String id);
	List<ElVO> getElsePaydata(String id);
	List<ElVO> getElseWhoReplied(String params);
	List<ElVO> getPetElsedata(String id);
	public int updatePay_Grade(ElVO elvo);
	public int insertGrade(ElVO elvo);
}