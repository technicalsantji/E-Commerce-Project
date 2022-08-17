/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.Entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author SANT JI
 */
public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    public int saveCategory( Category cat){
        int catid=0;
        try {
            Session session=factory.openSession();
            Transaction tx=session.beginTransaction();
          catid=(int) session.save(cat);
          
          tx.commit();
          session.close();
        } catch (Exception e) {
        }
       
       return catid;
    }
            
    public  List<Category> getCategories(){
             Session s=factory.openSession();
     
            Query q1=s.createQuery("from Category");
            List<Category> list= q1.list();
            
        return list;
    }
    public  Category getCategory(int catid){
        Category cat=null;
        try {
            Session session=factory.openSession();
         cat= session.get(Category.class, catid);
         session.close();
            
        } catch (Exception e) {
        }
        
        return cat;
    }
}
