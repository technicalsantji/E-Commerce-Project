/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.Dao.CategoryDao;
import com.Dao.ProductDao;
import com.Entities.Category;
import com.Entities.Product;
import com.gdguproject.helper.FactoryProviders;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author SANT JI
 */
@MultipartConfig
public class AddCategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String op = request.getParameter("operation");
            if (op.trim().equals("AddCategory")) {

                String title = request.getParameter("title");
                String content = request.getParameter("content");
                Category category = new Category(title, content);
                CategoryDao dao = new CategoryDao(FactoryProviders.getFactories());
                int catid = dao.saveCategory(category);

                HttpSession session = request.getSession();
                session.setAttribute("msg", "Category Added Successfully");
                response.sendRedirect("AdminHome.jsp");
                return;

            } else if (op.trim().equals("AddProduct")) {

                String pname = request.getParameter("name");
                String content = request.getParameter("content");
             int  price =Integer.parseInt( request.getParameter("price"));
                String catid1 = request.getParameter("catid");
                int catid = Integer.parseInt(catid1);
               int discount = Integer.parseInt(request.getParameter("discount"));
               int quantity1 = Integer.parseInt(request.getParameter("quantity"));
               
                Part part = request.getPart("photo");

                CategoryDao dao = new CategoryDao(FactoryProviders.getFactories());
                Category category = dao.getCategory(catid);

                Product product = new Product(pname, content, part.getSubmittedFileName(), price, discount, quantity1, category);
                ProductDao dao1 = new ProductDao(FactoryProviders.getFactories());
                dao1.saveProduct(product);

                String path = request.getRealPath("img") + File.separator + "pimg" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                try {

//               upload img
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

//               reading data
                    byte[] data = new byte[is.available()];
                    is.read(data);
//           writing data

                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Product Added Successfully ");
                response.sendRedirect("AdminHome.jsp");

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
