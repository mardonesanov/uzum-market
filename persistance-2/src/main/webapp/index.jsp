<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP - Uzum Market</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            position: relative;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://admin.uzum.fanda.cloud/wp-content/uploads/2024/09/og-image.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px) brightness(0.7);
            z-index: -1;
            animation: zoomIn 20s alternate ease-in-out;
        }
        .container {
            background: rgba(0, 0, 0, 0.7);
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
            animation: fadeInUp 1.5s ease-in-out;
            z-index: 1;
            text-align: center;
        }
        .btn-custom {
            margin: 20px;
            padding: 15px 30px;
            font-size: 18px;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.4s, transform 0.4s;
            display: inline-flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }
        .btn-signin {
            background: linear-gradient(135deg, #28a745, #218838);
        }
        .btn-signup {
            background: linear-gradient(135deg, #007bff, #0056b3);
        }
        .btn-custom:hover {
            transform: translateY(-5px);
            opacity: 0.9;
        }
        .btn-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.3);
            transform: skewX(-20deg);
            transition: left 0.5s;
        }
        .btn-custom:hover::before {
            left: 100%;
        }
        .fas {
            margin-right: 10px;
        }
        h1 {
            color: #007bff;
            margin-bottom: 30px;
            animation: pulse 2s;
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
        @keyframes zoomIn {
            from {
                transform: scale(1);
            }
            to {
                transform: scale(1.05);
            }
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
<div class="background"></div> <!-- Orqa fon -->
<div class="container animate__animated animate__fadeInUp">
    <h1><i class="fas fa-store"></i> Uzum Market</h1>
    <a href="/signin" class="btn-custom btn-signin">
        <i class="fas fa-sign-in-alt"></i> Sign In
    </a>
    <a href="/signup" class="btn-custom btn-signup">
        <i class="fas fa-user-plus"></i> Sign Up
    </a>
</div>
</body>
</html>
