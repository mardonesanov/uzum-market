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
import java.util.List;
import java.util.ArrayList;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBConnection.getEntityManager();
        try {
            List<Product> products = em.createQuery("SELECT p FROM Product p", Product.class).getResultList();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/views/products.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if (productId != null) {
            EntityManager em = DBConnection.getEntityManager();
            try {
                em.getTransaction().begin();
                Product product = em.find(Product.class, Long.parseLong(productId));
                if (product != null) {
                    List<Product> cart = (List<Product>) request.getSession().getAttribute("cart");
                    if (cart == null) {
                        cart = new ArrayList<>();
                        request.getSession().setAttribute("cart", cart);
                    }
                    cart.add(product);
                }
                em.getTransaction().commit();
                response.getWriter().write("Mahsulot muvaffaqiyatli savatchaga qo'shildi."); // Foydalanuvchiga xabar berish
            } catch (Exception e) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Xato: Mahsulotni qo'shishda muammo yuz berdi.");
            } finally {
                em.close();
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Xato: Mahsulot identifikatori noto'g'ri.");
        }
    }
}