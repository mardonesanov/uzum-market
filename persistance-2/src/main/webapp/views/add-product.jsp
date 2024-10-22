<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>Mahsulot Qo'shish</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://vzglyad.uz/_next/image?url=https%3A%2F%2Fvzglyad.uz%2Fuploads%2F2024%2F07%2F05%2F406d7900-cdc1-4498-b798-d9638e7adafe.jpg&w=1536&q=75') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            transform: translateY(-20px);
            transition: transform 0.5s ease-in-out;
            max-width: 600px;
        }
        .container:hover {
            transform: translateY(0);
        }
        .btn-primary {
            background: linear-gradient(135deg, #007bff, #00b3ff);
            border: none;
            transition: background 0.4s, transform 0.4s;
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.5);
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #0099cc);
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 86, 179, 0.7);
        }
        .btn-secondary {
            transition: background 0.4s, transform 0.4s;
        }
        .btn-secondary:hover {
            background: #6c757d;
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.7);
        }
        input, textarea, select {
            transition: box-shadow 0.3s;
        }
        input:focus, textarea:focus, select:focus {
            box-shadow: 0 0 10px #007bff;
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
        .animate-form {
            animation: fadeInUp 1s ease-in-out;
        }
        .fa-plus-circle, .fa-box, .fa-align-left, .fa-list-alt, .fa-dollar-sign, .fa-arrow-left, .fa-image {
            color: #007bff;
            transition: transform 0.4s, color 0.4s;
        }
        .fa-plus-circle:hover, .fa-box:hover, .fa-align-left:hover, .fa-list-alt:hover, .fa-dollar-sign:hover, .fa-arrow-left:hover, .fa-image:hover {
            transform: rotate(20deg) scale(1.2);
            color: #0056b3;
            filter: drop-shadow(0 0 5px rgba(0, 123, 255, 0.5));
        }
    </style>
</head>
<body>
<div class="container animate-form" >
    <h2 class="text-center mb-4 animate__animated animate__fadeIn"><i class="fas fa-plus-circle"></i> Mahsulot Qo'shish</h2>
    <form action="/add-product" method="post" class="w-100 animate__animated animate__fadeInUp animate__delay-1s">
        <div class="mb-3">
            <label for="name" class="form-label"><i class="fas fa-box"></i> Mahsulot Nomi</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label"><i class="fas fa-align-left"></i> Tavsif</label>
            <textarea id="description" name="description" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label for="category" class="form-label"><i class="fas fa-list-alt"></i> Kategoriya</label>
            <select id="category" name="category" class="form-select" required>
                <option value="">Kategoriyani Tanlang</option>
                <% List<String> categories = (List<String>) request.getAttribute("categories"); %>
                <% if (categories != null && !categories.isEmpty()) { %>
                <% for (String category : categories) { %>
                <option value="<%= category %>"><%= category %></option>
                <% } %>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label for="imageUrl" class="form-label"><i class="fas fa-image"></i> Rasm URL</label>
            <input type="text" id="imageUrl" name="imageUrl" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label"><i class="fas fa-dollar-sign"></i> Narx</label>
            <input type="number" step="0.01" id="price" name="price" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-plus"></i> Mahsulot Qo'shish</button>
    </form>
    <div class="text-center mt-3 animate__animated animate__fadeInUp animate__delay-2s">
        <a href="/products" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
    </div>
</div>
</body>
</html>
