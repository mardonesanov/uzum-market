<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Xarid Muvaffaqiyatli Amalga Oshirildi</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background: url('https://optim.tildacdn.one/tild3638-6138-4564-a438-656364396132/-/format/webp/Ellipse_113.png') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1s ease-in-out;
            width: 90%;
            max-width: 600px;
            text-align: center;
        }
        .btn-primary {
            background: linear-gradient(135deg, #28a745, #218838);
            border: none;
            transition: background 0.4s, transform 0.4s;
            font-size: 1.25rem;
            color: #ffffff;
            padding: 15px 30px;
            border-radius: 8px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            display: inline-flex;
            align-items: center;
            text-decoration: none;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #218838, #1e7e34);
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
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
        .success-icon {
            font-size: 5rem;
            color: #28a745;
            animation: bounceIn 1s ease-in-out;
        }
        @keyframes bounceIn {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-30px);
            }
            60% {
                transform: translateY(-15px);
            }
        }
        .text-success {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
<div class="container animate__animated animate__fadeInUp">
    <h2 class="text-center text-success mb-4"><i class="fas fa-check-circle success-icon animate__animated animate__heartBeat"></i> Mahsulot Muvaffaqiyatli Qabul Qilindi</h2>
    <p class="text-center">Xaridingiz uchun tashakkur! Buyurtmangiz muvaffaqiyatli amalga oshirildi va ko'rsatilgan manzilga yetkaziladi.</p>
    <div class="text-center mt-4">
        <a href="/products" class="btn btn-primary animate__animated animate__pulse">Xaridni Davom Ettirish <i class="fas fa-shopping-cart ms-2"></i></a>
    </div>
</div>
</body>
</html>
