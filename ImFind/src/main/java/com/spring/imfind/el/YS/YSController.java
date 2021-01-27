package com.spring.imfind.el.YS;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.spring.mapper.YS.ElMapper;
@Controller
public class YSController {
   @Autowired
   private ElService elService;
   @RequestMapping("/mypage")
   public String mypage(HttpServletRequest request) {
      HttpSession session = request.getSession();
      System.out.println(session.getAttribute("loginUser"));
      return "el/YS/mypage";
   }
   @RequestMapping(value="/getElsedata",method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody  
   public List<ElVO> getElsedata(HttpServletRequest request) {
	   
      HttpSession session = request.getSession();         
      String id=(String)session.getAttribute("loginUser"); 
      System.out.println("session id1 : " + id);      
      
      List<ElVO> list = elService.getElsedata(id);
      System.out.println("list"+list );
      return list;
   }
      @RequestMapping(value="/getPetElsedata",method=RequestMethod.POST,
               produces="application/json;charset=UTF-8")
      @ResponseBody  
      public List<ElVO> getPetElsedata(HttpServletRequest request) {
      HttpSession session = request.getSession();         
      String id=(String)session.getAttribute("loginUser");      
      System.out.println("session id1 : " + id);      
      List<ElVO> listpet = elService.getPetElsedata(id);
      System.out.println("list"+listpet );
      return listpet;
      }
   @RequestMapping(value="/getElsePaydata",method=RequestMethod.POST,
                                    produces="application/json;charset=UTF-8")
   @ResponseBody 
   public List<ElVO> getElsePaydata(HttpServletRequest request) {
      HttpSession session = request.getSession();
      String id= (String)session.getAttribute("loginUser"); 
      System.out.println("session id2 : " + id);
      List<ElVO> list2 = elService.getElsePaydata( id );
      System.out.println("list2"+list2 );
      return list2;
   }
   
   
   @RequestMapping(value="/getElseWhoReplied",method=RequestMethod.POST,
         produces="application/json;charset=UTF-8")
   @ResponseBody
      public List<ElVO> getElseWhoReplied(String params) {
	  System.out.println("getElseWhoReplied " + params);
	   
      List<ElVO> list3 = elService.getElseWhoReplied(params);
      System.out.println("list3"+list3 );
      return list3;
   }   

   // 평점 입력하기 -> 1.insert grade, 2.update pay table
   @RequestMapping(value="/insertGrade.do")
   @ResponseBody
   public Map<String, Object> insertGrade(@RequestBody HashMap<String, String> map){
	   
	   ElVO elvo = new ElVO();
	   
	   System.out.println("inserGrade in");
	   
	   System.out.println(map.get("F_ID"));
	   System.out.println("grade " + map.get("grade"));
	   System.out.println("lost_num " + map.get("Lost_PostNum"));
	   
	   elvo.setF_ID(map.get("F_ID"));
	   elvo.setGrade(Integer.parseInt(map.get("grade")));
	   elvo.setLost_PostNum(Integer.parseInt(map.get("Lost_PostNum")));
	   elvo.setId(map.get("Id"));
	   
	   
	   Map<String, Object> retVal = new HashMap<String, Object>();
	   
	   try {
			int res = elService.insertGrade(elvo);
			if(res == 1) {
				
				elvo.setDeal_State("completed");
				int res2 = elService.updatePay_Grade(elvo);
				System.out.println("update 상태 " + res2);
				
				retVal.put("res","OK");
			}
	   }
	   catch(Exception e)
	   {
		 System.out.println(e.getMessage());
		 retVal.put("res","FAIL");
		 retVal.put("message","Failure");		
	   }
	   return retVal;
   }

   @RequestMapping("/index")
   public String index2() {
      return "el/index";
   }
}