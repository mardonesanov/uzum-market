package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.app.persistance2.entity.Cart;
import uz.app.persistance2.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/signin");
            return;
        }

        List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems_" + user.getId());
        if (cartItems == null) {
            response.sendRedirect("/cart");
            return;
        }

        int cartIndex;
        try {
            cartIndex = Integer.parseInt(request.getParameter("cartIndex"));
        } catch (NumberFormatException e) {
            response.sendRedirect("/cart?error=invalid_index");
            return;
        }

        if (cartIndex >= 0 && cartIndex < cartItems.size()) {
            Cart cartItem = cartItems.get(cartIndex);
            String action = request.getParameter("action");
            if ("increase".equals(action)) {
                cartItem.setQuantity(cartItem.getQuantity() + 1);
            } else if ("decrease".equals(action) && cartItem.getQuantity() > 1) {
                cartItem.setQuantity(cartItem.getQuantity() - 1);
            }
            session.setAttribute("cartItems_" + user.getId(), cartItems);
        }

        response.sendRedirect("/cart");
    }
}