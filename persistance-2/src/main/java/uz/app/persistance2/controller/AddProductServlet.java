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
import java.util.Arrays;
import java.util.List;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {

    private static final List<String> categories = Arrays.asList(
            "Sport va dam olish",
            "Uy jihozlari",
            "Go'zallik va parvarish",
            "Oziq-ovqat va ichimliklar",
            "Bolalar uchun mahsulotlar",
            "Moda va kiyim-kechak",
            "Hayvonlar uchun mahsulotlar",
            "Avtomobil jihozlari va aksessuarlar"
    );

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("categories") == null) {
            request.getSession().setAttribute("categories", categories);
        }

        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/views/add-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("imageUrl");
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
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setCategory(category);
            product.setPrice(price);
            product.setImageUrl(imageUrl);
            em.persist(product);
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
