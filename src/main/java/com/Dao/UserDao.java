/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.Entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
   public User getUserByEmailAndPassword(String email,String password){
       User user=null;
       try {
           
           String query = "from User where uemail=:x and upassword=:n";
           Session s=this.factory.openSession();
           Query q=s.createQuery(query);
           q.setParameter("x", email);
           q.setParameter("n", password);
           user=(User)q.uniqueResult();
           s.close();
           
           
       } catch (Exception e) {
           e.printStackTrace();
          
       }
       
       return user;
   }
   
    
}
