package com.spring.imfind.el.EJ;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		System.out.println("Cancel_Date"+ Cancel_Date);
		payVO.setCancel_Date(Cancel_Date);
		
		System.out.println("취소payvo:" + payVO.toString());
		int res = adminService.updatePaystate(payVO);
		List<PayVO> cancelList = adminService.getPayList();
		
		return cancelList;
	}
	//admintest_payList
	   @RequestMapping("/admintest_payList")
	   public String admintest_payList() {
	      return "el/YS/admintest_payList";
	   }
	   //./admintest_paidList
	   @RequestMapping("/admintest_paidList")
	   public String admintest_paidList() {
	      return "el/YS/admintest_paidList";
	   }
	   //"./admintest_refundList" 
	   @RequestMapping("/admintest_refundList")
	   public String admintest_refundList() {
	      return "el/YS/admintest_refundList";
	   }
	   //./admintest_adjustmentList
	   @RequestMapping("/admintest_adjustmentList")
	   public String admintest_adjustmentList() {
	      return "el/YS/admintest_adjustmentList";
	   }
	
}