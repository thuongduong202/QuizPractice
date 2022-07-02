/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.Cookie;

public class MyLib {
   public static String searchCookie(Cookie [] a, String xName) {
      String u = null; 
      if(a==null) return(null);
      for(Cookie x : a) {
          if(x.getName().equals(xName)) return(x.getValue());
      }
      return(u);
   }    
}

