
package com.spring.imfind.el.EJ;

import java.util.List;

public interface AdminService {
	public List<MemberVO> getMemberList();

	public List<PayVO> getPayList();

	public List<PayVO> getPaidList();

	public List<PayVO> getRefundList();

	public int updatePaystate(PayVO payVO);

	public List<PayVO> getCancleList();
}
