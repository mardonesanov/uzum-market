package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.DBConnection;
import uz.app.persistance2.entity.User;
import uz.app.persistance2.entity.Product;
import org.mindrot.jbcrypt.BCrypt;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.io.IOException;
import java.util.List;

@WebServlet("/signin")
public class SigninServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/signin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        EntityManager em = DBConnection.getEntityManager();
        try {
            User user = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", email)
                    .getSingleResult();

            if ("admin@gmail.com".equals(email) && "777".equals(password)) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("isAdmin", true);
                response.sendRedirect("products");
            } else if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("isAdmin", false);
                response.sendRedirect("products");
            } else {
                response.sendRedirect("views/error-admin.jsp");
            }
        } catch (NoResultException e) {
            response.sendRedirect("signin?error=Invalid credentials");
        } finally {
            em.close();
        }
    }
}