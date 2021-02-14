
package com.spring.mapper.YH;

import java.util.List;

import com.spring.imfind.el.Money.PayDTO;

public interface MoneyMapper {
	public List<PayDTO> getMoneyList(String id);

	public List<PayDTO> getAdjustmentList();

	public List<PayDTO> getAdjustmentList2();

	public int giveMoney(PayDTO vo);

	public int giveMoneyPet(PayDTO vo);
}
