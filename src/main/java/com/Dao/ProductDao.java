/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.Entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author SANT JI
 */
public class ProductDao {
    
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product){
        boolean f=false;
        try {
            Session s=factory.openSession();
            Transaction tx=s.beginTransaction();
            s.save(product);
            
           
            tx.commit();
            s.close();
             f=true;
            
            
        } catch (Exception e) {
        }
        
        
        return f;
    }
    
    public List<Product> getAllProducts(){
        
        Session s=factory.openSession();
        Query q=s.createQuery("from Product");
        List<Product> list = q.list();
                
        
        return list;
    }
    
    public List<Product> getAllProductsBycatid(int cat){
        
        Session s=factory.openSession();
        Query q=s.createQuery("from Product as p where p.category.cid=:x");
        q.setParameter("x", cat);
        List<Product> list = q.list();
                
        
        return list;
    }
}
