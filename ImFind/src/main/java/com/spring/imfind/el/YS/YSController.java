<<<<<<< HEAD

package com.spring.imfind.el.YS;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

=======
package com.spring.imfind.el.YS;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
>>>>>>> main_dev
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
<<<<<<< HEAD

@Controller
public class YSController {
   
   @Autowired
   private ElService elService;
   
   
=======
import com.spring.mapper.YS.ElMapper;
@Controller
public class YSController {
   @Autowired
   private ElService elService;
>>>>>>> main_dev
   @RequestMapping("/mypage")
   public String mypage(HttpServletRequest request) {
      HttpSession session = request.getSession();
      System.out.println(session.getAttribute("loginUser"));
<<<<<<< HEAD
      
   
      return "el/YS/mypage";
   }
   
   
   
=======
      return "el/YS/mypage";
   }
>>>>>>> main_dev
   @RequestMapping(value="/getElsedata",method=RequestMethod.POST,
                                    produces="application/json;charset=UTF-8")
   @ResponseBody  
   public List<ElVO> getElsedata(HttpServletRequest request) {
<<<<<<< HEAD
      HttpSession session = request.getSession();   
      
      String id=(String)session.getAttribute("loginUser");
      
      System.out.println("session id1 : " + id);
      
=======
      HttpSession session = request.getSession();         
      String id=(String)session.getAttribute("loginUser");      
      System.out.println("session id1 : " + id);      
>>>>>>> main_dev
      List<ElVO> list = elService.getElsedata(id);
      System.out.println("list"+list );
      return list;
   }
<<<<<<< HEAD
   
      @RequestMapping(value="/getPatElsedata",method=RequestMethod.POST,
               produces="application/json;charset=UTF-8")
      @ResponseBody  
      public List<ElVO> getPatElsedata(HttpServletRequest request) {
      HttpSession session = request.getSession();   
      
      String id=(String)session.getAttribute("id");
      
      System.out.println("session id1 : " + id);
      
      List<ElVO> listpat = elService.getElsedata(id);
      System.out.println("list"+listpat );
      return listpat;
      }
         
         
=======
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
>>>>>>> main_dev
   @RequestMapping(value="/getElsePaydata",method=RequestMethod.POST,
                                    produces="application/json;charset=UTF-8")
   @ResponseBody 
   public List<ElVO> getElsePaydata(HttpServletRequest request) {
<<<<<<< HEAD
      
      HttpSession session = request.getSession();
      
      String id= (String)session.getAttribute("loginUser"); 
      
      System.out.println("session id2 : " + id);
      
=======
      HttpSession session = request.getSession();
      String id= (String)session.getAttribute("loginUser"); 
      System.out.println("session id2 : " + id);
>>>>>>> main_dev
      List<ElVO> list2 = elService.getElsePaydata( id );
      System.out.println("list2"+list2 );
      return list2;
   }
<<<<<<< HEAD
      
   @RequestMapping(value="/getElseWhoReplied",method=RequestMethod.POST,
         produces="application/json;charset=UTF-8")
   @ResponseBody
      public List<ElVO> getElseWhoReplied(String Lost_Postnum) {
      
      List<ElVO> list3 = elService.getElseWhoReplied( Lost_Postnum );
      
      System.out.println("list3"+list3 );
      return list3;
   }   
      
      
      
   @RequestMapping("/index")
   public String index2() {
      
      return "el/index";
   }
   
   

=======
   @RequestMapping(value="/getElseWhoReplied",method=RequestMethod.POST,
         produces="application/json;charset=UTF-8")
   @ResponseBody
      public List<ElVO> getElseWhoReplied(String params) {
      List<ElVO> list3 = elService.getElseWhoReplied( params );
      System.out.println("list3"+list3 );
      return list3;
   }   
   //---------------------------------------------------------------
   /*
   @RequestMapping(value="/insertGrade,updatePay_Grade",method=RequestMethod.POST,
	         produces="application/json;charset=UTF-8")
	   @ResponseBody
	   public Map<String, Object> insertGrade(ElVO elvo){
	   	Map<String, Object> retVal=new HashMap<String, Object>();
	   		try {
	   			elService.insertGrade(elvo);
	   			elService.updatePay_Grade(elvo);
	   			retVal.put("res","OK");
	   		}
	   		catch(Exception e)
	   		{
	   		 retVal.put("res","FAIL");
			 retVal.put("message","Failure");		
	   		}
	   	 return retVal;
	 }
   */
   // 평점 입력하기 -> 1.insert grade, 2.update pay table
   @RequestMapping(value="/insertGrade.do",method=RequestMethod.POST,
	         produces="application/json;charset=UTF-8")
   @ResponseBody
   public Map<String, Object> insertGrade(ElVO elvo){
	   System.out.println("inserGrade in");
	   	System.out.println(elvo.toString());
	   Map<String, Object> retVal=new HashMap<String, Object>();
	   try {
			elService.insertGrade(elvo);
			elvo.setDeal_State("completed");
			elService.updatePay_Grade(elvo);
			retVal.put("res","OK");
	   }
	   catch(Exception e)
	   {
		 System.out.println(e.getMessage());
		 retVal.put("res","FAIL");
		 retVal.put("message","Failure");		
	   }
	   return retVal;
   }
	/*
	 * int retVal=elService.insertGrade(elvo); retVal.put("res","OK");
	 * 
	 * int urs=elService.updatePay_Grade(elvo);
	 * 
	 * 
	 * 
	 * return urs+res;
	 * 
	 * }
	 */
   //---------------------------------------------------------------
   @RequestMapping("/index")
   public String index2() {
      return "el/index";
   }
>>>>>>> main_dev
}