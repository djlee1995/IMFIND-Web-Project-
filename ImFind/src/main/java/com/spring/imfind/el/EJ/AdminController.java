package com.spring.imfind.el.EJ;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/adminhome", method=RequestMethod.GET)
	public String home() {
		return "el/EJ/adminpage";
	}
	
	@RequestMapping(value = "/adminmember", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MemberVO>memberAll(MemberVO membervo) {
		List<MemberVO> memberlist = adminService.getMemberList();
		System.out.println("memberlist="+ memberlist.toString());
		
		return memberlist;
	}
	
	@RequestMapping(value = "/adminpay", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PayVO> payAll(PayVO payvo) {
		List<PayVO> paylist = adminService.getPayList();
		System.out.println("paylist="+ paylist.toString());
		
		return paylist;
	}
	
	@RequestMapping(value = "/adminpaid", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PayVO> pay_paid(PayVO payvo) {
		List<PayVO> paylist = adminService.getPaidList();
		System.out.println("paylist="+ paylist.toString());
		
		return paylist;
	}
	
	@RequestMapping(value = "/adminrefund", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<PayVO> pay_refund(PayVO payvo) {
		List<PayVO> paylist = adminService.getRefundList();
		System.out.println("paylist="+ paylist.toString());
		
		return paylist;
	}

	@RequestMapping(value = "/adminpaycancel", method = RequestMethod.POST)
	@ResponseBody
	public String cancel(@RequestParam(value="merchant_uid")String merchant_uid) {
		System.out.println("merchant_uid=" + merchant_uid);
		//String PayCode = merchant_uid;
		//int payres = adminService.updatePaystate(PayCode);
		
		
		PaymentCheck obj = new PaymentCheck();
		String token = obj.getImportToken();
		int res = obj.cancelPayment(token, merchant_uid);
		if (res == 1){
			//PayVO payVO = new PayVO();
			
			return "Success";
		}else {
			return "Failure";
		}
	}
	
	@RequestMapping(value = "/admincancel", method = RequestMethod.POST)
	@ResponseBody
	//public String cancel_success(@RequestParam(value="payCode")String payCode) {
	public List<PayVO> cancel_success(@RequestBody HashMap<String, String> map) {
		// 여기까지 요청은 받는거 같은에 페이코드가 널이네용!! 요것만찾아내면 되겠어요!!
		System.out.println(map.get("Id"));
		System.out.println(map.get("PayCode"));
		String pay_State = "cancel";
		PayVO payVO = new PayVO();
		payVO.setId(map.get("Id"));
		payVO.setPayCode(map.get("PayCode"));
		payVO.setPay_State(pay_State);
		
		System.out.println("취소payvo:" + payVO.toString());
		int res = adminService.updatePaystate(payVO);
		List<PayVO> cancelList = adminService.getPayList();
		// 그런데 여기서 1을 리턴해줬습
		return cancelList;
	}
	
}