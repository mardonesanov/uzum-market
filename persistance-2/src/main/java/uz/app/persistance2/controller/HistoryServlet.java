package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.app.persistance2.db.DBConnection;
import uz.app.persistance2.entity.History;
import uz.app.persistance2.entity.User;

import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.util.List;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/signin");
            return;
        }

        EntityManager em = DBConnection.getEntityManager();
        try {
            List<History> historyItems = em.createQuery("SELECT h FROM History h WHERE h.user.id = :userId", History.class)
                    .setParameter("userId", user.getId())
                    .getResultList();

            request.setAttribute("historyItems", historyItems);
            request.getRequestDispatcher("/views/history.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }
}