package com.spring.mapper.YS;
import java.util.List;
import com.spring.imfind.el.YS.ElVO;

public interface ElMapper {
	List<ElVO> getElsedata(String id);
	List<ElVO> getPetElsedata(String id);
	List<ElVO> getElsePaydata(String id);
	//List<ElVO> getElseWhoReplied(String lost_Postnum);//1
	List<ElVO> getElseWhoReplied(int param);//2
	public int insertGrade(ElVO elvo);
	public int updatePay_Grade(ElVO elvo);
	//public void updatePay_Grade(ElVO elvo);
}