package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.app.persistance2.entity.User;

import java.io.IOException;

@WebServlet("/profile")
public class ProfileButtonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = getUserFromSession(session);

        if (user == null) {
            redirectToSignIn(response);
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
    }

    private User getUserFromSession(HttpSession session) {
        return (User) session.getAttribute("user");
    }

    private void redirectToSignIn(HttpServletResponse response) throws IOException {
        response.sendRedirect("/signin");
    }
}