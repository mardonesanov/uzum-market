<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="uz.app.persistance2.entity.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://the-tech.kz/wp-content/uploads/2024/02/pexels-karolina-grabowska-5632402-scaled.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 1s ease-in-out;
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
<div class="container mt-5 animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4"><i class="fas fa-edit" style="color: #007bff;"></i> Update Product</h2>
    <form action="/update-product" method="post" class="w-50 mx-auto">
        <input type="hidden" name="productId" value="<%= ((Product) request.getAttribute("product")).getId() %>">
        <div class="mb-3">
            <label for="name" class="form-label"><i class="fas fa-box" style="color: #28a745;"></i> Product Name</label>
            <input type="text" id="name" name="name" class="form-control" value="<%= ((Product) request.getAttribute("product")).getName() %>" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label"><i class="fas fa-align-left" style="color: #17a2b8;"></i> Description</label>
            <textarea id="description" name="description" class="form-control" required><%= ((Product) request.getAttribute("product")).getDescription() %></textarea>
        </div>
        <div class="mb-3">
            <label for="category" class="form-label"><i class="fas fa-list-alt" style="color: #ffc107;"></i> Category</label>
            <select id="category" name="category" class="form-select" required>
                <option value="">Select Category</option>
                <% List<String> categories = (List<String>) request.getAttribute("categories"); if (categories == null) { categories = List.of("Sport va dam olish", "Uy jihozlari", "Go'zallik va parvarish", "Oziq-ovqat va ichimliklar", "Bolalar uchun mahsulotlar", "Moda va kiyim-kechak", "Hayvonlar uchun mahsulotlar", "Avtomobil jihozlari va aksessuarlar"); } %>
                <% if (categories != null) { %>
                <% for (String category : categories) { %>
                <option value="<%= category %>" <%= ((Product) request.getAttribute("product")).getCategory().equals(category) ? "selected" : "" %>><%= category %></option>
                <% } %>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label for="imageUrl" class="form-label"><i class="fas fa-image" style="color: #ff5733;"></i> Image URL</label>
            <input type="text" id="imageUrl" name="imageUrl" class="form-control" value="<%= ((Product) request.getAttribute("product")).getImageUrl() %>" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label"><i class="fas fa-dollar-sign" style="color: #ffc107;"></i> Price</label>
            <input type="number" step="0.01" id="price" name="price" class="form-control" value="<%= ((Product) request.getAttribute("product")).getPrice() %>" required>
        </div>
        <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Update Product</button>
    </form>
    <div class="text-center mt-3">
        <a href="/products" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
    </div>
</div>
<script>
    document.querySelector('form').addEventListener('submit', function() {
        // Reload image preview and category in products.jsp after updating
        const imageUrl = document.getElementById('imageUrl').value;
        const category = document.getElementById('category').value;
        sessionStorage.setItem('updatedImageUrl', imageUrl);
        sessionStorage.setItem('updatedCategory', category);
    });
</script>
</body>
</html>
