
<%@page import="java.util.Map"%>
<%@page import="com.gdguproject.helper.Helper"%>
<%@page import="com.Entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.gdguproject.helper.FactoryProviders"%>
<%@page import="com.Dao.CategoryDao"%>
<%@page import="com.Entities.User"%>
<%

    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        session.setAttribute("msg", "This page not directed access ! please Login");
        response.sendRedirect("Login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("msg", "you can not acces admin page  .");
            response.sendRedirect("Login.jsp");
        }

    }

                             
                                CategoryDao dao1= new CategoryDao (FactoryProviders.getFactories());
                                List <Category> lis= dao1.getCategories();
                                

               Map<String,Long>   m=Helper.getcount(FactoryProviders.getFactories());
                                
%>


<%-- 
    Document   : AdminHome
    Created on : Aug 12, 2022, 3:43:01 PM
    Author     : SANT JI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <%@include file="Component/all_css_js_bootstrap.jsp" %>
        <link rel="stylesheet" href="css/style.css"/>
        
         <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"  />
        
        
    </head>
    <body class="regiback">
        <%@include  file="Navbar.jsp" %>
        <div class="container admin">
            <%@include file="Message.jsp" %>
            <div class="row mt-3">
                <!--first column-->

                <div class="col-md-4"> 

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container text-center">
                                <img src="img1/team.png" style="max-width: 130px"  class="img-fluid rounded-circle"alt="alt"/>
                            </div>

                            <h3><%=  m.get("usercount")   %></h3>
                            <h2>user</h2>
                        </div>

                    </div>

                </div

                <!--second column-->

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container text-center">
                                <img src="img1/menu-bar.png" style="max-width: 130px"  class="img-fluid rounded-circle"alt="alt"/>
                            </div>
                            <h3><%= lis.size() %></h3>
                            <h2>Categories</h2>
                        </div>

                    </div>

                </div>

                <!--third column-->

                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container text-center">
                                <img src="img1/add-to-cart.png" style="max-width: 130px"  class="img-fluid rounded-circle"alt="alt"/>
                            </div>
                            <h3><%=  m.get("procount")   %></h3>
                            <h2>Product</h2>
                        </div>

                    </div>
                </div>
            </div>

            <!--second Row-->

            <!--row 2 ..col 1-->
            <!-- modal box  trigger modal -->
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card"  data-toggle="modal" data-target="#category-modal">
                        <div class="card-body text-center">
                            <div class="container text-center">
                                <img src="img1/calculator.png" style="max-width: 130px"  class="img-fluid rounded-circle"alt="alt"/>
                            </div>
                            <p>click to  add category</p>
                            <h2>Add Category</h2>
                        </div>
                    </div>
                </div>

                <!-- row 2 ..col 2-->

                <div class="col-md-6">
                    <div class="card "  data-toggle="modal" data-target="#product-modal">
                        <div class="card-body text-center">
                            <div class="container text-center">
                                <img src="img1/plus.png" style="max-width: 130px"  class="img-fluid rounded-circle"alt="alt"/>
                            </div>
                            <p>click to add product</p>
                            <h2>Add Product</h2>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <!--category modal box coding-->

        <!-- Modal -->
        <div class="modal fade" id="category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header gradiant3">
                        <h5 class="modal-title " id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddCategory" method="post">
                            <input type="hidden" name="operation" value="AddCategory"/>
                            <div class="form-group">
                                <input type="text" name="title" class="form-control"  placeholder="Enter the Title ..." required="">
                            </div>

                            <div class="form-group">
                                <input type="text" name="content" class="form-control"  placeholder="Enter the Descriptions  ..." required="">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Add</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--modal end category-->

        <!--modal product start-->
        <!-- Modal -->
        <div class="modal fade" id="product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header gradiant3">
                        <h5 class="modal-title " id="exampleModalLabel">Product Add</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddCategory" method="post" enctype="multipart/form-data">
                        
                                <input type="hidden" name="operation" value="AddProduct"/>
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control"  placeholder="Enter the Product Name ...">
                                </div>

                                <div class="form-group">
                                    <textarea id="id" name="content" class="form-control"  placeholder="Enter the Descriptions  ."  rows="5" cols="10"></textarea>
                                </div>


                                <div class="form-group">
                                    <input type="text" name="price" class="form-control"  placeholder="Enter the Price  ...">
                                </div>


                                <div class="form-group">
                                    <input type="text" name="discount" class="form-control"  placeholder="Enter the Discount ...">
                                </div>


                                <div class="form-group">
                                    <input type="text" name="quantity" class="form-control"  placeholder="Enter the Quantity  ...">
                                </div>
                                
                                
                                
                                <div class="form-group">
                                    <select name="catid"  class="form-control">
                                        <%
                                        for(Category c:lis){
                                        %>
                                        <option value="<%= c.getCid()  %>"><%= c.getCtitle()  %></option>
                                        
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                
                                

                                <div class="form-group">
                                    <input type="file" name="photo" class="form-control"  />
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                    </div>

                </div>
            </div>
        </div>
        <!--product modal end--> 
        <%@include file="Component/modal.jsp" %>
    </body>
</html>
