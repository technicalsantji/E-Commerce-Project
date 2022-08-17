<%-- 
    Document   : index
    Created on : Aug 8, 2022, 7:04:38 PM
    Author     : SANT JI
--%>

<%@page import="com.gdguproject.helper.Helper"%>
<%@page import="com.Entities.Product"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.Entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.CategoryDao"%>
<%@page import="com.gdguproject.helper.FactoryProviders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/all_css_js_bootstrap.jsp" %>
        <script src="js1.js"></script>
    </head>
    <body>
        <%@include file="Navbar.jsp"%>

        <div class="container-fluid">

            <div class="row mt-3">
                <div class="col-md-2">


                    <%                        String cat88 = request.getParameter("category");
//                    out.print(cat88);
                        ProductDao dao1 = new ProductDao(FactoryProviders.getFactories());
                        List<Product> products = null;
                        
                       
                        
                       if (cat88==null || cat88.equals("all")) {
                            products = dao1.getAllProducts();
                        } else {
                            int cid = Integer.parseInt(cat88.trim());
                            products = dao1.getAllProductsBycatid(cid);

                        }

                        CategoryDao dao = new CategoryDao(FactoryProviders.getFactories());
                        List<Category> list = dao.getCategories();

                    %>

                    <div class="list-group" >
                        <a class="list-group-item list-group-item-action active" href="index.jsp?category=all"  >All Category</a>
                        <%          for (Category c : list) {
                        %>
                        <a  href="index.jsp?category=<%=c.getCid()%>"  class="list-group-item list-group-item-action" ><%=c.getCtitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>


                <div class="col-md-10">




                    <div class="row text-center">
                        <%
                            for (Product p : products) {
                        %>
                        <div class="col-md-4 mt-3">
                            <div class="card boshadow1 ">

                                <img class="card-img-top" style="max-height:250px;width:100%" src="img/pimg/<%= p.getPphoto()%>" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getPname()%></h5>
                                    <p class="card-text"><%= Helper.get15word(p.getPcontent())%></p>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary"  onclick="addcart(<%=p.getPid()  %> , '<%= p.getPname()  %>' , <%= p.getpriceafterdiscount() %>)"> Add to Cart </button>
                                    <a type="submit" class="btn btn-outline-success">&#8377;<%=p.getpriceafterdiscount() %> <span class="discount-label-original"><%= p.getPprice() %></span>  <span class="discount-label">  <%=p.getPdiscount()  %>%</span> </a>
                                </div>
                            </div>
                        </div>

                                
                                


                        <%
                            }

                            if (products.size() == 0) {
                                out.print("Not Available Product for this  category");
                            }


                        %>
                    </div>

                </div>

            </div>

        </div>
                        <%@include  file="Component/modal.jsp" %>

    </body>
</html>
