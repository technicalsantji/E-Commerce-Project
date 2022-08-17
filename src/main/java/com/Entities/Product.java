/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author SANT JI
 */
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy =GenerationType.IDENTITY)
    private int pid;
    private String pname;
    @Column(length =1500)
    private String pcontent;
    private String pphoto;
    private int pprice;
    private int pdiscount;
    private int pQuantity;
    @ManyToOne
    private Category category;

    public Product(int pid, String pname, String pcontent, String pphoto, int pprice, int pdiscount, int pQuantity, Category category) {
        this.pid = pid;
        this.pname = pname;
        this.pcontent = pcontent;
        this.pphoto = pphoto;
        this.pprice = pprice;
        this.pdiscount = pdiscount;
        this.pQuantity = pQuantity;
        this.category = category;
    }

    public Product() {
    }
    

    public Product(String pname, String pcontent, String pphoto, int pprice, int pdiscount, int pQuantity, Category category) {
        this.pname = pname;
        this.pcontent = pcontent;
        this.pphoto = pphoto;
        this.pprice = pprice;
        this.pdiscount = pdiscount;
        this.pQuantity = pQuantity;
        this.category = category;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPphoto() {
        return pphoto;
    }

    public void setPphoto(String pphoto) {
        this.pphoto = pphoto;
    }

    public int getPprice() {
        return pprice;
    }

    public void setPprice(int pprice) {
        this.pprice = pprice;
    }

    public int getPdiscount() {
        return pdiscount;
    }

    public void setPdiscount(int pdiscount) {
        this.pdiscount = pdiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "pid=" + pid + ", pname=" + pname + ", pcontent=" + pcontent + ", pphoto=" + pphoto + ", pprice=" + pprice + ", pdiscount=" + pdiscount + ", pQuantity=" + pQuantity + ", category=" + category + '}';
    }
    
    public int getpriceafterdiscount(){
    int di=(int) ((this.getPdiscount()/100.0)*this.getPprice());
    int dis=this.getPprice()-di;
     
   return dis;
    }
}
