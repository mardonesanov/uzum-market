package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.app.persistance2.db.DBConnection;
import uz.app.persistance2.entity.Cart;
import uz.app.persistance2.entity.Product;
import uz.app.persistance2.entity.User;

import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/signin");
            return;
        }

        Long productId = Long.parseLong(request.getParameter("productId"));
        EntityManager em = DBConnection.getEntityManager();
        try {
            Product product = em.find(Product.class, productId);
            if (product == null) {
                response.sendRedirect("/products");
                return;
            }

            List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems_" + user.getId());
            if (cartItems == null) {
                cartItems = new ArrayList<>();
            }

            boolean found = false;
            for (Cart item : cartItems) {
                if (item.getProduct().getId().equals(productId)) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            if (!found) {
                Cart cartItem = new Cart();
                cartItem.setProduct(product);
                cartItem.setQuantity(1);
                cartItems.add(cartItem);
            }

            session.setAttribute("cartItems_" + user.getId(), cartItems);
            response.sendRedirect("/products");
        } finally {
            em.close();
        }
    }
}