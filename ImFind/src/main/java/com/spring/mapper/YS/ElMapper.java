
package com.spring.mapper.YS;
import java.util.List;
import com.spring.imfind.el.YS.ElVO;

public interface ElMapper {
	List<ElVO> getElsedata(String id);
	List<ElVO> getPetElsedata(String id);
	List<ElVO> getElsePaydata(String id);
	List<ElVO> getElseWhoReplied(int param);
	List<ElVO> getElseWhoRepliedPet(int param);
	public int insertGrade(ElVO elvo);
	public int updatePay_Grade(ElVO elvo);
	public int updatePay_GradePet(ElVO elvo);
	// YS 1.28일
	List<ElVO> getStarGrade(String F_Id);
}