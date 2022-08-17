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

/**
 *
 * @author SANT JI
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int uid;
    private String uname;
    private String uemail;
    private String uphone;
    @Column(length =1500)
    private String upic;
    private String upassword;
    @Column(length =1800)
    private String uaddress;
    @Column(name ="utype")
    private String UserType;

    public User(int uid, String uname, String uemail, String uphone, String upic, String upassword, String uaddress,String UserType) {
        this.uid = uid;
        this.uname = uname;
        this.uemail = uemail;
        this.uphone = uphone;
        this.upic = upic;
        this.upassword = upassword;
        this.uaddress = uaddress;
        this.UserType=UserType;
    }

    public User() {
        
    }
    

    public User(String uname, String uemail, String uphone, String upic, String upassword, String uaddress,String UserType) {
        this.uname = uname;
        this.uemail = uemail;
        this.uphone = uphone;
        this.upic = upic;
        this.upassword = upassword;
        this.uaddress = uaddress;
         this.UserType=UserType;
    }

    public String getUserType() {
        return UserType;
    }

    public void setUserType(String UserType) {
        this.UserType = UserType;
    }
    

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getUpic() {
        return upic;
    }

    public void setUpic(String upic) {
        this.upic = upic;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

    @Override
    public String toString() {
        return "User{" + "uid=" + uid + ", uname=" + uname + ", uemail=" + uemail + ", uphone=" + uphone + ", upic=" + upic + ", upassword=" + upassword + ", uaddress=" + uaddress + '}';
    }
    
    
    
}
