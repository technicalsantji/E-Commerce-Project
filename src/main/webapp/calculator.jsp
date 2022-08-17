 <%@page import="com.gdguproject.helper.FactoryProviders"%>
<%@page import="com.Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Entities.Category"%>
<%
CategoryDao  dao1=new CategoryDao(FactoryProviders.getFactories());
List <Category> lis= dao1.getCategories();

for (Category c : lis) {
      
    
%>
<h1><%= c.getCtitle()    %></h1>


<%
}
%>