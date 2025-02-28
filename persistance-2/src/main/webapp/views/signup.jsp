<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
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
        }
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://4kwallpapers.com/images/walls/thumbs_3t/8324.png') no-repeat center center fixed;
            background-size: cover;
            filter: blur(5px); /* Blur effekti */
            z-index: -1;
        }
        .container {
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 1s ease-in-out;
            z-index: 1;
            background: rgba(255, 255, 255, 0.1); /* Ozgina shaffof oq fon */
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
        .form-label {
            font-weight: bold;
            color: #ffffff; /* Yorqin oq rang */
        }
        .form-control {
            border: 2px solid #ffffff; /* Yorqin oq chegara */
            color: #ffffff; /* Oq rangdagi matn */
            background: rgba(255, 255, 255, 0.1); /* Biroz shaffof oq fon */
        }
        .form-control::placeholder {
            color: #f0f0f0; /* Yorqin oq rangdagi placeholder */
        }
        .fas {
            color: #ffffff; /* Ikonkalarga oq rang */
        }
        h2 {
            color: #ffffff; /* Create an Account sarlavhasiga oq rang */
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
<div class="background"></div> <!-- Orqa fon rasmini blur bilan qo'shish -->
<div class="container animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4"><i class="fas fa-user-plus"></i> Create an Account</h2>
    <form action="signup" method="post" class="w-50 mx-auto">
        <div class="mb-3">
            <label for="name" class="form-label"><i class="fas fa-user"></i> Full Name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
        </div>
        <div class="mb-3">
            <label for="username" class="form-label"><i class="fas fa-user-tag"></i> Username</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label"><i class="fas fa-lock"></i> Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-user-plus"></i> Sign Up</button>
    </form>
    <div class="text-center mt-3">
        <a href="/signin" class="btn btn-secondary"><i class="fas fa-sign-in-alt"></i> Sign In</a>
    </div>
</div>
</body>
</html>
