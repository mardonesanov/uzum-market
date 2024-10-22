package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.app.persistance2.entity.User;
import uz.app.persistance2.entity.Cart;
import uz.app.persistance2.entity.History;
import uz.app.persistance2.db.DBConnection;
import jakarta.persistence.EntityManager;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/signin");
            return;
        }

        List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems_" + user.getId());
        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("/cart?error=empty");
            return;
        }

        String deliveryAddress = request.getParameter("deliveryAddress");
        if (deliveryAddress == null || deliveryAddress.isEmpty()) {
            deliveryAddress = "No address provided";
        }

        savePurchaseHistory(user, cartItems, deliveryAddress);

        clearUserCart(session, user);
        session.removeAttribute("cartItems_" + user.getId());
        deleteCartItemsFromDatabase(user);

        response.sendRedirect(request.getContextPath() + "/views/payment-method.jsp");
    }

    private void savePurchaseHistory(User user, List<Cart> cartItems, String deliveryAddress) {
        EntityManager em = DBConnection.getEntityManager();
        try {
            em.getTransaction().begin();
            for (Cart item : cartItems) {
                History history = new History();
                history.setUser(user);
                history.setProduct(item.getProduct());
                history.setQuantity(item.getQuantity());
                history.setTotalPrice(item.getQuantity() * item.getProduct().getPrice());
                history.setDeliveryAddress(deliveryAddress);
                em.persist(history);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    private void clearUserCart(HttpSession session, User user) {
        session.removeAttribute("cartItems_" + user.getId());
    }

    private void deleteCartItemsFromDatabase(User user) {
        EntityManager em = DBConnection.getEntityManager();
        try {
            em.getTransaction().begin();
            em.createQuery("DELETE FROM Cart c WHERE c.user = :user")
                    .setParameter("user", user)
                    .executeUpdate();
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
