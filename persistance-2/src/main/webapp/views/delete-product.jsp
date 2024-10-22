<%@ page import="uz.app.persistance2.entity.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>Mahsulotni O'chirish</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .btn-secondary {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="text-center mb-4">Mahsulotni O'chirish</h3>
    <%
        Product product = (Product) request.getAttribute("product");
        if (product != null) {
    %>
    <p>Mahsulot nomi: <strong><%= product.getName() %></strong></p>
    <p>Mahsulot tavsifi: <%= product.getDescription() %></p>
    <p>Mahsulot narxi: <%= product.getPrice() %> UZS</p>
    <form action="/delete-product" method="post">
        <input type="hidden" name="id" value="<%= product.getId() %>">
        <button type="submit" class="btn btn-danger" onclick="return confirm('Ishonchingiz komilmi?');">O'chirish</button>
    </form>
    <a href="/products" class="btn btn-secondary">Orqaga</a>
    <%
    } else {
    %>
    <p class="text-danger">Mahsulot topilmadi.</p>
    <a href="/products" class="btn btn-secondary">Orqaga</a>
    <%
        }
    %>
</div>
</body>
</html>