package com.spring.imfind.el.YS;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class YSController {
	
	@Autowired
	private ElService elService;
	
	//soo: views ���������� el ������ �ٷ� mypage�� �ִ°� �ƴ϶�. YS������ �����ؼ� ��ġ �̵��ؼ� ������. (12/31_1305)
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("id", "bnm1128");
		//session.setAttribute("id", "A001");
		
		return "el/YS/mypage";
	}
	
	
	
	@RequestMapping(value="/getElsedata",method=RequestMethod.POST,
												produces="application/json;charset=UTF-8")
	@ResponseBody//jsp�� ���� �並 ���� �ϴ� �� �ƴ� �����͸� ���� �ϱ� ���� ��� 
	public List<ElVO> getElsedata(HttpServletRequest request) {
		HttpSession session = request.getSession();	
		//List<EmpVO> list =empService.getEmpEx();
		String id=(String)session.getAttribute("id");
		
		System.out.println("session id1 : " + id);
		
		List<ElVO> list = elService.getElsedata(id);
		System.out.println("list"+list );
		return list;
	}
	
	
	@RequestMapping(value="/getElsePaydata",method=RequestMethod.POST,
												produces="application/json;charset=UTF-8")
	@ResponseBody//jsp�� ���� �並 ���� �ϴ� �� �ƴ� �����͸� ���� �ϱ� ���� ��� 	
	public List<ElVO> getElsePaydata(HttpServletRequest request) {
		//������Ʈ ��ü ���� ���� ��������
		HttpSession session = request.getSession();
		//session.getAttribute("id");
		//List<EmpVO> list =empService.getEmpEx();
		String id= (String)session.getAttribute("id"); //������Ʈ�� ��Ʈ������ ���� ��ȯ. 
		
		System.out.println("session id2 : " + id);
		
		List<ElVO> list2 = elService.getElsePaydata( id );
		System.out.println("list2"+list2 );
		return list2;
	}
		
	@RequestMapping(value="/getElseWhoReplied",method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody//
		public List<ElVO> getElseWhoReplied(String Lost_Postnum) {
		
		List<ElVO> list3 = elService.getElseWhoReplied( Lost_Postnum );
		//List<ElVO> list3 = elService.getElseWhoReplied( );
		System.out.println("list3"+list3 );
		return list3;
	}	
		
		
		
	@RequestMapping("/index")
	public String index2() {
		
		return "el/index";
	}
	
	
}