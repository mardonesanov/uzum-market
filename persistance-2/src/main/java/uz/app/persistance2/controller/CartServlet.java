package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.DBConnection;
import uz.app.persistance2.entity.Cart;
import uz.app.persistance2.entity.User;
import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBConnection.getEntityManager();
        try {
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect("signin");
                return;
            }

            List<Cart> cartItems = em.createQuery("SELECT c FROM Cart c WHERE c.user = :user", Cart.class)
                    .setParameter("user", user)
                    .getResultList();
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }
}