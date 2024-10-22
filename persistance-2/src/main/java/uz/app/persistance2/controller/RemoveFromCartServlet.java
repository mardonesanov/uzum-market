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

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/signin");
            return;
        }

        int cartIndex = Integer.parseInt(request.getParameter("cartIndex"));
        List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems_" + user.getId());

        if (cartItems != null) {
            if (cartIndex >= 0 && cartIndex < cartItems.size()) {
                cartItems.remove(cartIndex);
            }
            session.setAttribute("cartItems_" + user.getId(), cartItems);
        }

        response.sendRedirect("/cart");
    }
}