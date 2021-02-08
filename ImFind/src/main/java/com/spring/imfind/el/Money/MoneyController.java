package com.spring.imfind.el.Money;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MoneyController {

	@Autowired
	private MoneyService moneyService;

	// 마이페이지 정산
	@RequestMapping("/getMoneyList")
	public @ResponseBody List<PayDTO> getMoneyList(String id) {

		List<PayDTO> dto = moneyService.getMoneyList(id);

		return dto;
	}

	// 관리자페이지 정산
	@RequestMapping("/getAdjustmentList")
	public @ResponseBody List<PayDTO> getAdjustmentList() {

		List<PayDTO> dto = moneyService.getAdjustmentList();

		return dto;
	}

	// 관리자페이지 정산
	@RequestMapping("/getAdjustmentList2")
	public @ResponseBody List<PayDTO> getAdjustmentList2() {

		List<PayDTO> dto = moneyService.getAdjustmentList2();
		return dto;
	}

	// 정산 처리
	@RequestMapping("/giveMoney")
	public @ResponseBody String giveMoney(String F_ID, String Lost_PostNum) {
		PayDTO pay = new PayDTO();
		pay.setF_ID(F_ID);
		pay.setLost_PostNum(Integer.parseInt(Lost_PostNum));

		int res = moneyService.giveMoney(pay);
		if (res == 1) {
			return "ok";
		} else {
			return "fail";
		}
	}

	// 정산 처리
	@RequestMapping("/giveMoneyPet")
	public @ResponseBody String giveMoneyPet(String F_ID, String pet_PostNum) {
		PayDTO pay = new PayDTO();
		pay.setF_ID(F_ID);
		pay.setPet_PostNum(Integer.parseInt(pet_PostNum));

		int res = moneyService.giveMoney(pay);
		if (res == 1) {
			return "ok";
		} else {
			return "fail";
		}
	}
}
