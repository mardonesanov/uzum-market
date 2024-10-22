<%@ page import="uz.app.persistance2.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>To'lov Usuli</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            position: relative;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://habrastorage.org/getpro/habr/upload_files/e36/2d2/e11/e362d2e113284057909291e754e6a656.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 1s ease-in-out, floatingEffect 5s infinite alternate ease-in-out;
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
            color: #fff;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
        }
        .btn-primary:hover {
            background: #0056b3;
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 86, 179, 0.5);
        }
        .btn-secondary {
            background: #6c757d;
            color: #fff;
            border: none;
            transition: background 0.4s, transform 0.4s;
            font-size: 1.1rem;
            padding: 12px;
        }
        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-5px);
        }
        .form-check-label {
            font-weight: bold;
            font-size: 1rem;
        }
        .form-check-label i {
            margin-right: 10px;
            color: #007bff;
            transition: transform 0.4s ease-in-out, color 0.4s ease-in-out;
        }
        .form-check-input:checked + .form-check-label i {
            transform: rotate(360deg);
            color: #28a745;
        }
        .header-icon {
            font-size: 2.5rem;
            color: #007bff;
            transition: transform 0.6s ease-in-out;
        }
        .header-icon:hover {
            transform: scale(1.1) rotate(-10deg);
        }
    </style>
</head>
<body>
<div class="background"></div> <!-- Orqa fon rasmini blur bilan qo'shish -->
<div class="container animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4">
        <i class="fas fa-credit-card header-icon"></i> To'lov Usulini Tanlang
    </h2>
    <form action="/payment-process" method="post">
        <div class="form-check mb-3">
            <input class="form-check-input" type="radio" name="paymentMethod" value="cash" id="cash" required>
            <label class="form-check-label" for="cash">
                <i class="fas fa-money-bill-wave"></i> Naqd Pul
            </label>
        </div>
        <div class="form-check mb-3">
            <input class="form-check-input" type="radio" name="paymentMethod" value="card" id="card" required>
            <label class="form-check-label" for="card">
                <i class="fas fa-credit-card"></i> Karta
            </label>
        </div>
        <button type="submit" class="btn btn-primary w-100 mt-3">
            <i class="fas fa-arrow-right"></i> Keyingisi
        </button>
    </form>
    <div class="text-center mt-3">
        <a href="/cart" class="btn btn-secondary w-100">
            <i class="fas fa-arrow-left"></i> Orqaga
        </a>
    </div>
</div>
</body>
</html>
