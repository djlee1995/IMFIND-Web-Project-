
package com.spring.mapper.EJ;

import java.util.List;

import com.spring.imfind.el.EJ.MemberVO;
import com.spring.imfind.el.EJ.PayVO;

public interface AdminMapper {
	public List<MemberVO> getMemberList();

	public List<PayVO> getPayList();

	public List<PayVO> getPaidList();

	public List<PayVO> getRefundList();

	public int updatePaystate(PayVO payVO);

	public List<PayVO> getCancleList();
}
