package com.spring.imfind.el.Money;

import java.util.HashMap;
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
	@ResponseBody
	public HashMap<String, Object> getAdjustmentList() {

		List<PayDTO> dto = moneyService.getAdjustmentList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", dto);
		return map;
	}

	// 관리자페이지 정산
	@RequestMapping("/getAdjustmentList2")
	@ResponseBody
	public HashMap<String, Object> getAdjustmentList2() {

		List<PayDTO> dto = moneyService.getAdjustmentList2();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", dto);
		return map;
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