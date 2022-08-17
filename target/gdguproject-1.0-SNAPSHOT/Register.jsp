<%-- 
    Document   : Regiter
    Created on : Aug 9, 2022, 6:33:04 PM
    Author     : SANT JI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="Component/all_css_js_bootstrap.jsp" %>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body class="regiback">
        <%@include file="Navbar.jsp"%>
        <div class="container-fluid">
             <div class="row">
            <div class="col-md-4 offset-md-4 mt-3">
                <div class="card boxshaow gradiant3 p-2 ">
                    <div class="card-body text-center">
                        <i class="fa fa-user-plus" style="color:white;font-size:50px" aria-hidden="true"></i>
                         <h3 class="text-center text-white">Create Account</h3>
                         <%@include file="Message.jsp" %>
                         <form action="Register" method="post" id="myform">
              
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Enter the Name" required=""/>
                    </div>
                    
                    
                     <div class="form-group">
                         <input type="email" name="email" class="form-control" placeholder="Enter the Email" required=""/>
                    </div>
                    
                     <div class="form-group">
                         <input type="text" name="phone" class="form-control" placeholder="Enter the Phone" required=""/>
                     </div>
                     <div class="form-group">
                         <input type="password" name="password" class="form-control" placeholder="Enter the Password" required=""/>
                     </div>
                    
                     <div class="form-group">
                         <textarea id="id" name="address" rows="5" cols="10" class="form-control" placeholder="Enter the Address " required=""></textarea>
                    </div>
                    
                    <div class="container text-center text-white ">
                        <button type="submit" class=" boxshaow btn bg-success myhover form-control1">Create Account</button>
                        <button type="reset" class=" boxshaow btn bg-danger form-control1">Reset</button><br>
                        Have a already  Account  &nbsp; <a style="color: white; font-size:20px;border-bottom: 1px groove blue;text-decoration: none" href="Login.jsp">Login</a>
                    </div>
                </form>
                    </div>  
                </div>
                
            </div>
        </div>
        
            
        </div>
    
    </body>
    
    
    
    
</html>
