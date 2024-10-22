<%@ page import="uz.app.persistance2.entity.Cart" %>
<%@ page import="uz.app.persistance2.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>Karta To'lovi</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCSzQ7i2GMzOJPVnHub2bDPkX_kFDFWXcXrCMlcp0XS6Nm5zqPODWntYwpXYmbqzf9Nmk&usqp=CAU') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transform: translateY(-20px);
            transition: transform 0.5s ease-in-out;
            max-width: 600px;
        }
        .container:hover {
            transform: translateY(0);
        }
        .btn-primary {
            background: #007bff;
            border: none;
            transition: background 0.4s, transform 0.4s;
        }
        .btn-primary:hover {
            background: #0056b3;
            transform: translateY(-5px);
        }
        .btn-secondary {
            transition: background 0.4s, transform 0.4s;
        }
        .btn-secondary:hover {
            background: #6c757d;
            transform: translateY(-5px);
        }
        input, textarea, select {
            transition: box-shadow 0.3s;
        }
        input:focus, textarea:focus, select:focus {
            box-shadow: 0 0 10px #007bff;
        }
        .product-list {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 10px;
        }
        .animate-form {
            animation: fadeInUp 1s ease-in-out;
        }
    </style>
    <script>
        function detectCardType() {
            const cardNumber = document.getElementById("cardNumber").value;
            const cardType = document.getElementById("cardType");
            const cvvField = document.getElementById("cvvField");

            if (cardNumber.length >= 4) {
                if (cardNumber.startsWith("4")) {
                    cardType.value = "Visa";
                    cvvField.style.display = "block";
                } else if (cardNumber.startsWith("8600")) {
                    cardType.value = "UzCard";
                    cvvField.style.display = "none";
                } else if (cardNumber.startsWith("9860")) {
                    cardType.value = "Humo";
                    cvvField.style.display = "none";
                } else if (cardNumber.startsWith("5")) {
                    cardType.value = "MasterCard";
                    cvvField.style.display = "block";
                } else {
                    cardType.value = "";
                    cvvField.style.display = "none";
                }
            }
        }

        function calculateTotalAmount() {
            const totalAmountElement = document.getElementById("totalAmount");
            const totalAmount = parseFloat(totalAmountElement.dataset.total);
            totalAmountElement.value = totalAmount.toFixed(2) + " UZS";
        }

        document.addEventListener("DOMContentLoaded", function() {
            calculateTotalAmount();
        });
    </script>
</head>
<body>
<div class="container animate-form">
    <h2 class="text-center mb-4 animate__animated animate__fadeIn"><i class="fas fa-credit-card"></i> Karta To'lovi</h2>
    <div class="product-list">
        <h5 class="text-center" style="font-size: 1.5rem; color: #333;">Xarid qilinayotgan mahsulotlar:</h5>
        <ul class="list-unstyled">
            <% User user = (User) session.getAttribute("user");
                List<Cart> cartItems = user != null ? (List<Cart>) session.getAttribute("cartItems_" + user.getId()) : null;
                double totalAmount = 0;
                if (cartItems != null) {
                    for (Cart item : cartItems) {
                        totalAmount += item.getQuantity() * item.getProduct().getPrice(); %>
            <li class="d-flex align-items-center mb-2">
                <img src="<%= item.getProduct().getImageUrl() %>" alt="Mahsulot rasmi" class="product-image">
                <span><%= item.getProduct().getName() %> - <%= item.getQuantity() %> dona</span>
            </li>
            <%     }
            } %>

            <div class="mb-4 text-center">
                <h5><strong>Jami summa:</strong> <%= String.format("%,.0f", totalAmount) %> UZS</h5>
                <p class="text-muted">Kartangizdan <%= String.format("%,.0f", totalAmount) %> UZS miqdorda pul yechib olinadi.</p>
            </div>
        </ul></div>
    <form action="/complete-purchase" method="post" class="w-100 animate__animated animate__fadeInUp animate__delay-1s">
        <div class="mb-3">
            <label for="cardType" class="form-label"><i class="fas fa-id-card"></i> Kartalar </label>
            <select id="cardType" name="cardType" class="form-select" required>
                <option value="">Karta Turi</option>
                <option value="UzCard">UzCard</option>
                <option value="Humo">Humo</option>
                <option value="Visa">Visa</option>
                <option value="MasterCard">MasterCard</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="cardNumber" class="form-label"><i class="fas fa-credit-card"></i> Karta Raqami</label>
            <input type="text" id="cardNumber" name="cardNumber" class="form-control" maxlength="16" required oninput="detectCardType()">
        </div>
        <div class="mb-3">
            <label for="expiryDate" class="form-label"><i class="fas fa-calendar-alt"></i> Amal qilish Muddati (MM/YY)</label>
            <input type="text" id="expiryDate" name="expiryDate" class="form-control" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])/\d{2}" required>
        </div>
        <div class="mb-3" id="cvvField">
            <label for="cvv" class="form-label"><i class="fas fa-lock"></i> CVV Kodi</label>
            <input type="text" id="cvv" name="cvv" class="form-control" maxlength="3" pattern="\d{3}">
        </div>
        <div class="mb-4">
            <label for="deliveryAddress" class="form-label"><i class="fas fa-map-marker-alt"></i> Yetkazib Berish Manzili</label>
            <select id="deliveryAddress" name="deliveryAddress" class="form-select" required>
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
        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-shopping-cart"></i> Xaridni Yakunlash</button>
    </form>
    <div class="text-center mt-3 animate__animated animate__fadeInUp animate__delay-2s">
        <a href="/views/payment-method.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
    </div>
</div>
</
