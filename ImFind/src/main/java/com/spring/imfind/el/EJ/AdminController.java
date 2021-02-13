package com.spring.imfind.el.EJ;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/adminhome", method = RequestMethod.GET)
	public String home() {
		return "el/EJ/adminpage";
	}

	@RequestMapping(value = "/adminmember", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberVO> memberAll(MemberVO membervo) {
		List<MemberVO> memberlist = adminService.getMemberList();

		return memberlist;
	}

	@RequestMapping(value = "/adminmember2", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> memberAll2(MemberVO membervo) {
		List<MemberVO> memberlist = adminService.getMemberList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", memberlist);
		return map;
	}

	@RequestMapping(value = "/adminpay2", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> payAll2(PayVO payvo) {
		List<PayVO> paylist = adminService.getPayList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", paylist);
		return map;
	}

	@RequestMapping(value = "/adminpay", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PayVO> payAll(PayVO payvo) {
		List<PayVO> paylist = adminService.getPayList();

		return paylist;
	}

	// adminpaid
	@RequestMapping(value = "/adminpaid2", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> pay_paid2(PayVO payvo) {
		List<PayVO> paylist = adminService.getPaidList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", paylist);
		return map;
	}

	@RequestMapping(value = "/adminpaid", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PayVO> pay_paid(PayVO payvo) {
		List<PayVO> paylist = adminService.getPaidList();

		return paylist;
	}

	@RequestMapping(value = "/adminrefund2", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> pay_refund2(PayVO payvo) {
		List<PayVO> paylist = adminService.getRefundList();
		// System.out.println("paylist="+ paylist.toString());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", paylist);
		return map;
	}

	@RequestMapping(value = "/admincancleList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> admincancel(PayVO payvo) {
		List<PayVO> paylist = adminService.getCancleList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", paylist);
		return map;
	}

	@RequestMapping(value = "/adminrefund", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PayVO> pay_refund(PayVO payvo) {
		List<PayVO> paylist = adminService.getRefundList();

		return paylist;
	}

	@RequestMapping(value = "/adminpaycancel", method = RequestMethod.POST)
	@ResponseBody
	public String cancel(@RequestParam(value = "merchant_uid") String merchant_uid) {

		PaymentCheck obj = new PaymentCheck();
		String token = obj.getImportToken();
		int res = obj.cancelPayment(token, merchant_uid);
		if (res == 1) {

			return "Success";
		} else {
			return "Failure";
		}
	}

	@RequestMapping(value = "/admincancel", method = RequestMethod.POST)
	@ResponseBody

	public List<PayVO> cancel_success(@RequestBody HashMap<String, String> map) {
		System.out.println(map.get("Id"));
		System.out.println(map.get("PayCode"));
		String pay_State = "cancel";
		PayVO payVO = new PayVO();
		payVO.setId(map.get("Id"));
		payVO.setPayCode(map.get("PayCode"));
		payVO.setPay_State(pay_State);

		SimpleDateFormat time = new SimpleDateFormat("yy-MM-dd HH:mm");
		Date time2 = new Date();

		String Cancel_Date = time.format(time2);
		System.out.println("Cancel_Date" + Cancel_Date);
		payVO.setCancel_Date(Cancel_Date);

		System.out.println("취소payvo:" + payVO.toString());
		int res = adminService.updatePaystate(payVO);
		List<PayVO> cancelList = adminService.getPayList();

		return cancelList;
	}
	@RequestMapping("/admintest")
	public String afterLoginHeader() {
		return "el/YS/admintest";
	}
	
}