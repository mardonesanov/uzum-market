package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.DBConnection;
import uz.app.persistance2.entity.User;
import org.mindrot.jbcrypt.BCrypt;
import jakarta.persistence.EntityManager;

import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");

        EntityManager em = DBConnection.getEntityManager();
        try {
            em.getTransaction().begin();

            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
            user.setName(name);

            em.persist(user);
            em.getTransaction().commit();

            response.sendRedirect("signin");
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            response.sendRedirect("views/error.jsp");
        } finally {
            em.close();
        }
    }
}