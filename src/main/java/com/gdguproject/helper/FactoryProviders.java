/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gdguproject.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProviders {
    private static SessionFactory factory;
    public static SessionFactory getFactories(){
        try {
            if(factory==null){
            factory=new Configuration().configure("hiber.cfg.xml").buildSessionFactory();
            }
        } catch (Exception e) {
        }
        
        return factory;
    }
    
}
