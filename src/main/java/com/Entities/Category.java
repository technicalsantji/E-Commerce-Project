/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author SANT JI
 */
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;
    private String ctitle;
    @Column(length =1600)
    private String ccontent;
    @OneToMany(mappedBy ="category")
    private List<Product>products=new ArrayList<>();

    public Category(int cid, String ctitle, String ccontent) {
        this.cid = cid;
        this.ctitle = ctitle;
        this.ccontent = ccontent;
    }

    public Category() {
    }

    public Category(String ctitle, String ccontent) {
        this.ctitle = ctitle;
        this.ccontent = ccontent;
    }

    public Category(String ctitle, String ccontent,List<Product> products) {
        this.ctitle = ctitle;
        this.ccontent = ccontent;
        this.products=products;
        
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCtitle() {
        return ctitle;
    }

    public void setCtitle(String ctitle) {
        this.ctitle = ctitle;
    }

    public String getCcontent() {
        return ccontent;
    }

    public void setCcontent(String ccontent) {
        this.ccontent = ccontent;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Category{" + "cid=" + cid + ", ctitle=" + ctitle + ", ccontent=" + ccontent + ", products=" + products + '}';
    }
    
    
    
}
