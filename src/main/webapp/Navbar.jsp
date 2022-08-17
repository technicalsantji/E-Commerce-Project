
<%@page import="com.Entities.User"%>
<%
    User u=(User)session.getAttribute("currentuser");


%>




<nav class="navbar navbar-expand-lg navbar-dark bg-light gradiant3 bottomshadow1">
    <a class="navbar-brand" href="index.jsp"><i class="fa fa-globe mr-1" style="color:blue;font-size:30px;margin-top:4px" aria-hidden="true"></i>
Technical Santji</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
        
          <li class="nav-item active">
              <a class="nav-link" data-toggle="modal" data-target="#cart" ><i class="fa fa-shopping-cart mr-1" aria-hidden="true"></i><span class="cart-item">( )</span></a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><i class="fa fa-home mr-1" aria-hidden="true"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link " href="#"><i class="fa fa-address-book-o mr-1" aria-hidden="true"></i>Contact <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="fa fa-caret-square-o-left mr-1" aria-hidden="true"></i> Category
        </a>
        <div class="dropdown-menu gradiant2" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
         
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <% 
      if(u==null){
      
      %>
       <li class="nav-item active">
          <a class="nav-link" href="Register.jsp"><i class="fa fa-user-plus mr-1" aria-hidden="true"></i>SignUp<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="Login.jsp"><i class="fa fa-sign-in mr-1" aria-hidden="true"></i>Login<span class="sr-only">(current)</span></a>
      </li>
      
      <%
          }
else{
      %>
       <li class="nav-item active">
           <a class="nav-link" href="<%=  u.getUserType().equals("admin")?"AdminHome.jsp":"Home.jsp" %>"> <i class="fa fa-user-circle-o mr-1" aria-hidden="true"></i><%= u.getUname()  %><span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="Logout"><i class="fa fa-sign-in mr-1" aria-hidden="true"></i>Logout<span class="sr-only">(current)</span></a>
      </li>
      <%
      
          }
      %>
     
     
    
    </ul>
  </div>
</nav>