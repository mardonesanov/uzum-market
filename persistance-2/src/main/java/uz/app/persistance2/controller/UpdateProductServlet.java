package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.DBConnection;
import uz.app.persistance2.entity.Product;
import jakarta.persistence.EntityManager;

import java.io.IOException;

@WebServlet("/update-product")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long productId = null;
        try {
            productId = Long.parseLong(request.getParameter("id"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
            return;
        }

        EntityManager em = DBConnection.getEntityManager();
        try {
            Product product = em.find(Product.class, productId);
            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/views/update-product.jsp").forward(request, response);
            } else {
                response.sendRedirect("products");
            }
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long productId = null;
        try {
            productId = Long.parseLong(request.getParameter("productId"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
            return;
        }

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");  // Rasm URL'ini olish
        Double price = null;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
            return;
        }

        EntityManager em = DBConnection.getEntityManager();
        try {
            em.getTransaction().begin();
            Product product = em.find(Product.class, productId);
            if (product != null) {
                product.setName(name);
                product.setDescription(description);
                product.setImageUrl(imageUrl);  // Rasm URL'ini yangilash
                product.setPrice(price);
            }
            em.getTransaction().commit();
            response.sendRedirect("products");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
        } finally {
            em.close();
        }
    }
}
