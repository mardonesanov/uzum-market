<%@ page import="uz.app.persistance2.entity.User" %>
<%@ page import="uz.app.persistance2.entity.Cart" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>Naqd To'lov</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            position: relative;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            animation: backgroundAnimation 10s infinite alternate ease-in-out;
        }
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://media.licdn.com/dms/image/v2/D4D16AQGe5octmVkmNQ/profile-displaybackgroundimage-shrink_200_800/profile-displaybackgroundimage-shrink_200_800/0/1722866783346?e=2147483647&v=beta&t=YHg_MyLt8FaxIETEs38xdJ3XomU-RMd7ssg6UHnPMlc') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1;
        }
        @keyframes backgroundAnimation {
            0% {
                background: radial-gradient(circle, #f5f7fa, #c3cfe2);
            }
            100% {
                background: radial-gradient(circle, #c3cfe2, #f5f7fa);
            }
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            animation: fadeInUp 1s ease-in-out, floatingEffect 5s 1 alternate ease-in-out;
            z-index: 1;
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
        @keyframes floatingEffect {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-10px);
            }
        }
        .btn-primary {
            background: #007bff;
            border: none;
            transition: background 0.4s, transform 0.4s;
            font-size: 1.1rem;
            padding: 12px;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
        }
        .btn-primary:hover {
            background: #0056b3;
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 86, 179, 0.5);
        }
        .btn-secondary {
            transition: background 0.4s, transform 0.4s;
        }
        .btn-secondary:hover {
            background: #6c757d;
            transform: translateY(-5px);
        }
        input, select {
            transition: box-shadow 0.3s, transform 0.3s;
        }
        input:focus, select:focus {
            box-shadow: 0 0 10px #007bff;
            transform: scale(1.02);
        }
        .form-label {
            font-weight: bold;
            font-size: 1.1rem;
        }
        select {
            padding-left: 2.5rem;
            background-image: url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/svgs/solid/map-marker-alt.svg');
            background-repeat: no-repeat;
            background-position: 0.75rem center;
            background-size: 1rem;
        }
        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #007bff;
            position: relative;
        }
        h2::before {
            content: "\f155";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            position: absolute;
            left: -40px;
            font-size: 3rem;
            color: #28a745;
            animation: iconBounce 2s 1;
        }
        @keyframes iconBounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }
        .back-container a {
            font-size: 1.2rem;
            display: inline-flex;
            align-items: center;
            transition: transform 0.3s;
        }
        .back-container a:hover {
            transform: scale(1.1);
        }
        .back-container a i {
            margin-right: 10px;
            animation: iconHover 1s 1 alternate;
        }
        .product-list {
            margin-bottom: 20px;
        }
        .product-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            animation: fadeInUp 1s ease-in-out 1;
        }
        .product-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 15px;
        }
        .product-item .product-details {
            font-size: 1.1rem;
            color: #333;
        }
        .product-details strong {
            font-weight: bold;
            color: #007bff;
            animation: colorChange 2s 1 alternate;
        }
        @keyframes colorChange {
            0% {
                color: #007bff;
            }
            100% {
                color: #28a745;
            }
        }
        .summary-icon {
            font-size: 1.5rem;
            color: #007bff;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="background"></div>
<div class="container animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4"><i class="fas fa-hand-holding-usd"></i> Naqd To'lov</h2>
    <div class="product-list">
        <h4 class="animate__animated animate__pulse">Olingan Mahsulotlar:</h4>
        <!-- Mahsulotlarni ro'yxati -->
        <% User user = (User) session.getAttribute("user");
            List<Cart> cartItems = user != null ? (List<Cart>) session.getAttribute("cartItems_" + user.getId()) : null;
            if (cartItems != null) {
                for (Cart item : cartItems) { %>
        <div class="product-item">
            <img src="<%= item.getProduct().getImageUrl() %>" alt="Mahsulot">
            <div class="product-details">
                Mahsulot nomi: <strong><%= item.getProduct().getName() %></strong><br>
                Narxi: <strong><%= String.format("%,.0f", item.getProduct().getPrice()) %> UZS</strong><br>
                Miqdori: <strong><%= item.getQuantity() %> dona</strong>
            </div>
        </div>
        <%     }
        } %>
    </div>
    <div class="mb-4">
        <h4><i class="fas fa-coins summary-icon"></i>Jami summa:</h4>
        <p class="fs-4"><strong><%= String.format("%,.0f", cartItems != null ? cartItems.stream().mapToDouble(item -> item.getQuantity() * item.getProduct().getPrice()).sum() : 0) %> UZS</strong></p>
        <p class="text-muted"><i class="fas fa-wallet summary-icon"></i>Siz to'lashingiz kerak: <strong><%= String.format("%,.0f", cartItems != null ? cartItems.stream().mapToDouble(item -> item.getQuantity() * item.getProduct().getPrice()).sum() : 0) %> UZS</strong></p>
    </div>
    <form action="/complete-purchase" method="post">
        <div class="mb-3">
            <label for="deliveryAddress" class="form-label"><i class="fas fa-map-marker-alt"></i> Yetkazib berish manzili kiriting</label>
            <select id="deliveryAddress" name="deliveryAddress" class="form-select" required>
                <option value="" disabled selected>Manzilni tanlang...</option>
                <option value="Toshkent - Toshkent shahri">Toshkent - Toshkent shahri</option>
                <option value="Samarqand - Samarqand shahri">Samarqand - Samarqand shahri</option>
                <option value="Buxoro - Buxoro shahri">Buxoro - Buxoro shahri</option>
                <option value="Andijon - Andijon shahri">Andijon - Andijon shahri</option>
                <option value="Farg'ona - Farg'ona shahri">Farg'ona - Farg'ona shahri</option>
                <option value="Namangan - Namangan shahri">Namangan - Namangan shahri</option>
                <option value="Qashqadaryo - Qarshi shahri">Qashqadaryo - Qarshi shahri</option>
                <option value="Surxondaryo - Termiz shahri">Surxondaryo - Termiz shahri</option>
                <option value="Xorazm - Urganch shahri">Xorazm - Urganch shahri</option>
                <option value="Navoiy - Navoiy shahri">Navoiy - Navoiy shahri</option>
                <option value="Jizzax - Jizzax shahri">Jizzax - Jizzax shahri</option>
                <option value="Sirdaryo - Guliston shahri">Sirdaryo - Guliston shahri</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-check-circle"></i> Buyurma berish</button>
    </form>
    <div class="text-center mt-3 back-container">
        <a href="/views/payment-method.jsp" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Orqaga qaytish
        </a>
    </div>
</div>
</body>
</html>
