
package com.spring.imfind.el.Money;

import java.util.List;

import org.springframework.stereotype.Service;

public interface MoneyService {
	public List<PayDTO> getMoneyList(String id);

	public List<PayDTO> getAdjustmentList();

	public int giveMoney(PayDTO pay);

	public int giveMoneyPet(PayDTO pay);

	public List<PayDTO> getAdjustmentList2();
}
