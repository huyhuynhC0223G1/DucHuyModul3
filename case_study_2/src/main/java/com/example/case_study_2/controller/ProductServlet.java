package com.example.case_study_2.controller;

import com.example.case_study_2.model.Product;
import com.example.case_study_2.model.ProductType;
import com.example.case_study_2.service.IProductService;
import com.example.case_study_2.service.IProductTypeService;
import com.example.case_study_2.service.ProductService;
import com.example.case_study_2.service.ProductTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    private IProductTypeService productTypeService = new ProductTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                showlist(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<ProductType> productTypeList = productTypeService.getAll();
        request.setAttribute("productTypeList", productTypeList);
        Product productById = productService.selectProductById(id);
        request.setAttribute("productById", productById);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductType> productTypeList = productTypeService.getAll();
        request.setAttribute("productTypeList", productTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.showAll();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                save(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                showlist(request, response);
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        System.out.println(id);
        productService.deleteProduct(id);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int productTypeId = Integer.parseInt(request.getParameter("productType"));
        ProductType productType = new ProductType(productTypeId);
        Product product = new Product(id, name, description, price, image, productType);
        productService.updateProduct(product);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("message", "Update success");
            requestDispatcher = request.getRequestDispatcher("view/product/edit.jsp");
        }
        requestDispatcher.forward(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int productTypeId = Integer.parseInt(request.getParameter("productType"));
        ProductType productType = new ProductType(productTypeId);
        Product product = new Product(name, description, price, image, productType);
        productService.createNewProduct(product);
        RequestDispatcher requestDispatcher ;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("message", "Add new success");
            requestDispatcher = request.getRequestDispatcher("view/product/create.jsp");
        }
        requestDispatcher.forward(request, response);
    }
}
