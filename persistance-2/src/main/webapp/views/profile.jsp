<%@ page import="uz.app.persistance2.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profilim</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            background: url('https://assets.justinmind.com/wp-content/uploads/2020/02/website-background-design-guide-768x492.png') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 30px;
            padding-left: 15px;
            overflow: hidden;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1s ease-in-out;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 40%;
            max-height: 80%;
            overflow-y: auto;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            background: rgba(255, 255, 255, 0.8);
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.3);
        }
        .btn-secondary {
            transition: background 0.4s, transform 0.4s;
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
            border-radius: 10px;
            background: #6c757d;
            color: #ffffff;
            text-decoration: none;
            display: inline-block;
        }
        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .back-container {
            margin-top: 20px;
            text-align: center;
        }
        .card-icon {
            font-size: 2.5rem;
            color: #007bff;
            margin-bottom: 20px;
            transition: transform 0.6s ease-in-out, color 0.6s ease-in-out;
        }
        .card-icon:hover {
            transform: scale(1.2);
            color: #0056b3;
        }
        .card-text-icon {
            font-size: 1rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }
        .card-text-icon i {
            margin-right: 10px;
            color: #007bff;
            transition: transform 0.3s ease-in-out, color 0.3s ease-in-out;
        }
        .card-text-icon:hover i {
            transform: rotate(20deg);
            color: #0056b3;
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4" style="font-size: 2rem; color: #007bff;">Mening Profilim</h2>
    <%
        User user = (User) session.getAttribute("user");
        if (user != null) {
    %>
    <div class="card animate__animated animate__fadeInUp text-center p-4">
        <div class="card-body">
            <i class="fas fa-user-circle card-icon"></i>
            <h5 class="card-title" style="font-size: 1.2rem; color: #333; font-weight: bold;">Foydalanuvchi Ma'lumotlari</h5>
            <p class="card-text-icon"><i class="fas fa-user"></i><strong>Ism:</strong> <%= user.getName() %></p>
            <p class="card-text-icon"><i class="fas fa-at"></i><strong>Username:</strong> <%= user.getUsername() %></p>
            <p class="card-text-icon"><i class="fas fa-envelope"></i><strong>Gmail:</strong> <%= user.getEmail() %></p>
        </div>
    </div>
    <% } else { %>
    <p class="text-center" style="font-size: 1.5rem; color: #333;">Profil ma'lumotlarini ko'rish uchun tizimga kiring.</p>
    <% } %>
    <div class="back-container">
        <a href="/products" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back
        </a>
    </div>
</div>
</body>
</html>
