<%@ page import="uz.app.persistance2.entity.Product" %>
<%@ page import="uz.app.persistance2.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>Mahsulotlar</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .fixed-buttons {
            position: fixed;
            top: 10px;
            width: 100%;
            z-index: 1100;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-left: 3rem;
            padding-right: 3rem;
            background: none;
        }
        .profile-button, .back-button {
            margin: 0 20px;
            font-size: 1rem;
            padding: 10px;
            text-decoration: none;
            color: #fff;
            background: #007bff;
            border: none;
            border-radius: 200px;
            transition: all 0.3s ease;
        }
        .profile-button:hover, .back-button:hover {
            background: #0056b3;
            transform: scale(1.1);
        }
        .sticky-bottom-buttons {
            position: fixed;
            bottom: 10px;
            width: 30%;
            max-width: 300px;
            z-index: 1100;
            padding: 10px;
            display: flex;
            justify-content: center;
            gap: 10px;
            align-items: center;
            left: 50%;
            transform: translateX(-50%);
        }
        .cart-button, .history-button {
            margin: 0 7px;
            font-size: 0.9rem;
            padding: 8px;
            text-decoration: none;
            color: #fff;
            background: #007bff;
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease;
        }
        .cart-button:hover, .history-button:hover {
            background: #0056b3;
            transform: scale(1.1);
        }
        .sticky-top-search {
            margin-top: 80px;
            width: 100%;
            max-width: 100%;
            margin-left: auto;
            margin-right: auto;
        }
        .sticky-top-search input {
            width: 98%;
            padding: 10px;
            font-size: 1.2rem;
            height: 40px;
        }
        .sticky-top-search button {
            padding: 10px;
            font-size: 1.2rem;
            height: 40px;
        }
        .add-to-cart {
            position: relative;
            overflow: hidden;
            z-index: 1090;
        }
        .add-to-cart:hover {
            background: #28a745;
            transition: background 0.4s ease;
        }
        .add-to-cart-anim {
            animation: cart-bounce 0.8s cubic-bezier(0.25, 1.5, 0.5, 1);
            color: #fff;
        }
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1070;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            height: 250px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .card:hover .card-img-top {
            transform: scale(1.1);
        }
        .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .btn-modern {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 10px;
            border-radius: 10px;
            transition: all 0.3s ease;
            color: #fff;
            text-decoration: none;
            font-size: 0.9rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-warning-modern {
            background-color: #ffc107;
            border: none;
        }
        .btn-warning-modern:hover {
            background-color: #e0a800;
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        .btn-danger-modern {
            background-color: #dc3545;
            border: none;
        }
        .btn-danger-modern:hover {
            background-color: #c82333;
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        @keyframes cart-bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            30% {
                transform: translateY(-20px);
            }
            60% {
                transform: translateY(-10px);
            }
            90% {
                transform: translateY(-5px);
            }
        }
        .add-product-anim {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .add-product-anim:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .search-button-anim {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .search-button-anim:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }
        .search-button-anim:hover {
            transform: scale(1.15);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container mt-4 text-center">
    <img src="https://images.seeklogo.com/logo-png/53/1/uzum-market-logo-png_seeklogo-531745.png" alt="Logo" style="max-height: 100px;">
</div>

<div class="fixed-buttons">
    <a href="/signin" class="btn-modern back-button" style="display: inline-flex; align-items: center;"><i class="fas fa-arrow-left"></i> Orqaga</a>
    <a href="/profile" class="btn-modern profile-button" style="display: inline-flex; align-items: center;"><i class="fas fa-user-circle"></i> Profilim</a>
</div>

<div class="sticky-top-search d-flex justify-content-center align-items-center mb-4">
    <div class="d-flex justify-content-center search-container">
        <input type="text" id="searchInput" class="form-control" placeholder="Mahsulot nomini kiriting..." oninput="searchProduct()">
        <button class="btn btn-primary ms-2 search-button-anim" onclick="searchProduct()" style="display: inline-flex; align-items: center; padding: 12px; background-color: #007bff; border: none; border-radius: 25px; transition: all 0.3s ease;"><i class="fas fa-magnifying-glass"></i></button>
    </div>
</div>

<div class="container mt-5">
    <h2 class="text-center mb-4" style="font-size: 1.5rem;">Mahsulotlar Ro'yxati</h2>
    <%
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        List<String> categories = (List<String>) request.getSession().getAttribute("categories");
        User user = (User) session.getAttribute("user");
        List<Product> products = (List<Product>) request.getAttribute("products");
    %>

    <div class="text-center mb-4">
        <h5>Bo'limni tanlang:</h5>
        <form id="categoryForm">
            <select id="categorySelect" class="form-select w-50 mx-auto" onchange="filterByCategory(this.value)">
                <option value="">Barcha Bo'limlar</option>
                <% if (categories != null && !categories.isEmpty()) { %>
                <% for (String category : categories) { %>
                <option value="<%= category %>"><%= category %></option>
                <% } %>
                <% } %>
            </select>
        </form>
    </div>

    <% if (isAdmin != null && isAdmin) { %>
    <div class="text-center mb-4">
        <a href="/add-product" class="btn btn-success btn-modern add-product-anim" style="display: inline-flex; align-items: center;"><i class="fas fa-plus-circle"></i> Yangi Mahsulot Qo'shish</a>
    </div>
    <% } %>

    <% if (products != null && !products.isEmpty()) { %>
    <div class="row" id="productsContainer">
        <% for (Product product : products) { %>
        <div class="col-md-4 mb-3 product-item" data-category="<%= product.getCategory() %>" data-name="<%= product.getName().toLowerCase() %>">
            <div class="card">
                <img src="<%= product.getImageUrl() %>?t=<%= System.currentTimeMillis() %>" class="card-img-top" alt="Mahsulot rasmi">
                <div class="card-body">
                    <h5 class="card-title" style="font-size: 1.1rem;"><%= product.getName() %></h5>
                    <p class="card-text" style="font-size: 0.95rem;"><%= product.getDescription() %></p>
                    <p class="card-text" style="font-size: 0.95rem;"><strong>Bo'lim:</strong> <%= product.getCategory() %></p>
                    <% if (product.getPrice() != null) { %>
                    <p class="card-text" style="font-size: 0.95rem;"><strong>Narx:</strong> <%= String.format("%,.0f", product.getPrice()) %> UZS</p>
                    <% } else { %>
                    <p class="card-text text-danger" style="font-size: 0.95rem;">Narx mavjud emas</p>
                    <% } %>

                    <% if (isAdmin != null && isAdmin) { %>
                    <a href="/update-product?id=<%= product.getId() %>" class="btn-modern btn-warning-modern">
                        <i class="fas fa-edit"></i> Tahrirlash
                    </a>
                    <form action="/delete-product" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= product.getId() %>">
                        <button type="submit" class="btn-modern btn-danger-modern" onclick="return confirm('Ishonchingiz komilmi?');">
                            <i class="fas fa-trash-alt"></i> O'chirish
                        </button>
                    </form>
                    <% } else { %>
                    <% if (isAdmin == null || !isAdmin) { %>
                    <form action="/add-to-cart" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button type="submit" class="btn btn-primary add-to-cart">Savatga qo'shish</button>
                    </form>
                    <% } %>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <p class="text-center" style="font-size: 1rem;">Mahsulotlar mavjud emas.</p>
    <% } %>
</div>

<% if (isAdmin == null || !isAdmin) { %>
<div class="sticky-bottom-buttons">
    <a href="/cart" class="cart-button ms-3">
        <i class="fas fa-shopping-cart"></i><span> Savatga Kirish</span>
    </a>
    <a href="/history" class="history-button me-3">
        <i class="fas fa-history"></i><span> Tarixni Ko'rish</span>
    </a>
</div>
<% } %>

<script>
    function searchProduct() {
        var input = document.getElementById("searchInput").value.toLowerCase();
        var products = document.getElementsByClassName("product-item");
        for (var i = 0; i < products.length; i++) {
            var productName = products[i].getAttribute("data-name");
            if (productName.includes(input)) {
                products[i].style.display = "block";
            } else {
                products[i].style.display = "none";
            }
        }
    }
    function filterByCategory(category) {
        console.log("Tanlangan kategoriya: " + category);
        var products = document.getElementsByClassName("product-item");

        for (var i = 0; i < products.length; i++) {
            var productCategory = products[i].getAttribute("data-category").toLowerCase().trim();
            console.log("Mahsulot kategoriya: " + productCategory);
            if (category === "" || productCategory === category.toLowerCase().trim()) {
                products[i].style.display = "block";
            } else {
                products[i].style.display = "none";
            }
        }
    }
</script>

</body>
</html>
