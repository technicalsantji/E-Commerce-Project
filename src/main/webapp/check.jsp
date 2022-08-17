<%-- 
    Document   : check
    Created on : Aug 16, 2022, 12:21:41 AM
    Author     : SANT JI
--%>



<% 

User user=(User)session.getAttribute("currentuser");
if(user==null){
     session.setAttribute("msg", "you are not logged in  ! please Login");
     response.sendRedirect("Login.jsp");
     return;
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>check</title>
        <%@include file="Component/all_css_js_bootstrap.jsp" %>
        <script src="js1.js"></script>
    </head>
    <body>
        <%@include file="Navbar.jsp"%>
        
        
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Your item  Selected </h3>
                            <div class="cart-body">
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="col-md-6">
                     <div class="card">
                        <div class="card-body">
                            <h3 class="text-center"> Your Details </h3>
                           <form action="#" method="post" id="myform">
              
                    <div class="form-group">
                        <input type="text" name="name" value="<%= user.getUname() %>" class="form-control" placeholder="Enter the Name" required=""/>
                    </div>
                    
                    
                     <div class="form-group">
                         <input type="email" value="<%=user.getUemail() %>"  name="email" class="form-control" placeholder="Enter the Email" required=""/>
                    </div>
                    
                     <div class="form-group">
                         <input type="text" value="<%=user.getUphone() %>"  name="phone" class="form-control" placeholder="Enter the Phone" required=""/>
                     </div>
                   
                    
                     <div class="form-group">
                         <textarea id="id" value="<%= user.getUaddress() %>"  name="address" rows="5" cols="10" class="form-control" placeholder="Enter the Address " required=""></textarea>
                    </div>
                    
                    <div class="container text-center text-white ">
                        <a href="Pay.jsp" type="submit" class=" boxshaow btn bg-success myhover form-control1">Order Now</a>
                        <a href="index.jsp" type="submit" class=" boxshaow btn bg-danger form-control1">Continue Shooping</a><br>
                        
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        
        
        <%@include  file="Component/modal.jsp" %>
    </body>
</html>
