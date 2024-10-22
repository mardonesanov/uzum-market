package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.app.persistance2.entity.User;
import java.io.IOException;

@WebServlet("/payment-process")
public class PaymentProcessServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/signin");
            return;
        }
        String paymentMethod = request.getParameter("paymentMethod");
        if (paymentMethod == null) {
            response.sendRedirect(request.getContextPath() + "/views/payment-method.jsp?error=Please+select+a+payment+method");
            return;
        }

        if (paymentMethod.equals("cash")) {
            response.sendRedirect(request.getContextPath() + "/views/cash-delivery.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/views/card-payment.jsp");
        }
    }
}