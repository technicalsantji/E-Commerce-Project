/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gdguproject.helper;

import com.sun.org.apache.bcel.internal.generic.RET;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author SANT JI
 */
public class Helper {
    
    public static String get15word(String desc){
        String [] str=desc.split(" ");
        if(str.length>15){
             String res=" ";
            for(int i=0;i<16;i++){
               res=res+str[i]+" ";
                
            }
            return (res+" ...");
        }
        else{
            return desc+"...";
        }
    }
    public  static Map<String,Long> getcount (SessionFactory factory){
        Session session=factory.openSession();
      String  q1="Select count(*) from User";
        String  q2="Select count(*) from Product";
        Query q12=session.createQuery(q1);
         Query q13=session.createQuery(q2);
      Long usercount=(Long)q12.list().get(0);
      Long procount=(Long)q13.list().get(0);
        Map<String,Long> map=new HashMap<>();
         map.put("usercount", usercount);
          map.put("procount", procount);
               session.close();
         
       return map;
        }
    
    
}
