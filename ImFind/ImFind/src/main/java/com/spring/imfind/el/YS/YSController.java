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
   
   
   @RequestMapping("/mypage")
   public String mypage(HttpServletRequest request) {
      HttpSession session = request.getSession();
      System.out.println(session.getAttribute("loginUser"));
      
   
      return "el/YS/mypage";
   }
   
   
   
   @RequestMapping(value="/getElsedata",method=RequestMethod.POST,
                                    produces="application/json;charset=UTF-8")
   @ResponseBody  
   public List<ElVO> getElsedata(HttpServletRequest request) {
      HttpSession session = request.getSession();   
      
      String id=(String)session.getAttribute("loginUser");
      
      System.out.println("session id1 : " + id);
      
      List<ElVO> list = elService.getElsedata(id);
      System.out.println("list"+list );
      return list;
   }
   
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
      public List<ElVO> getElseWhoReplied(String Lost_Postnum) {
      
      List<ElVO> list3 = elService.getElseWhoReplied( Lost_Postnum );
      
      System.out.println("list3"+list3 );
      return list3;
   }   
      
      
      
   @RequestMapping("/index")
   public String index2() {
      
      return "el/index";
   }
   
   
}