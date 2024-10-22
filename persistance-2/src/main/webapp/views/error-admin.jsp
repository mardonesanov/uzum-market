<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>Admin Xato</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ff6f69, #ffcc5c);
            animation: gradientMove 5s ease infinite alternate;
            overflow: hidden;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1s ease-in-out;
        }
        .alert-icon {
            color: #c0392b;
            font-size: 4rem;
            animation: bounceIn 1.5s ease infinite alternate;
        }
        h2 {
            color: #c0392b;
            font-weight: bold;
        }
        .btn-primary {
            background: linear-gradient(135deg, #3498db, #2980b9);
            border: none;
            padding: 10px 20px;
            color: #ffffff;
            font-size: 1rem;
            border-radius: 25px;
            transition: all 0.4s ease;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #2980b9, #1abc9c);
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
        @keyframes gradientMove {
            0% {
                background: linear-gradient(135deg, #ff6f69, #ffcc5c);
            }
            100% {
                background: linear-gradient(135deg, #ffcc5c, #ff6f69);
            }
        }
        @keyframes bounceIn {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }
    </style>
</head>
<body>
<div class="container animate__animated animate__fadeInDown">
    <div class="alert-icon">
        <i class="fas fa-exclamation-circle"></i>
    </div>
    <h2 class="mt-3">Xato!</h2>
    <p>parol noto'g'ri kiritildi. Iltimos, qayta urinib ko'ring.</p>
    <a href="/signin" class="btn btn-primary mt-4 animate__animated animate__pulse animate__infinite"><i class="fas fa-sign-in-alt"></i> Sign In</a>
</div>
</body>
</html>
