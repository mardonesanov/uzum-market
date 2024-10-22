<%@ page import="uz.app.persistance2.entity.Cart" %>
<%@ page import="uz.app.persistance2.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>Savatcha</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvuVDSn13_q-hqHcOZvpfMCqVRxDSijbadyA&s') no-repeat center center fixed;
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
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        .btn-primary, .btn-secondary {
            border: none;
            font-size: 1rem;
            padding: 10px;
        }
        .btn-danger {
            padding: 5px 15px;
        }
        .cart-title-icon {
            color: #6c63ff; /* Zamonaviy rang */
            font-size: 2rem;
        }
        .table-icon {
            color: #ff6f61; /* Zamonaviy rang */
            margin-right: 5px;
        }
        .action-buttons button {
            margin: 0 3px;
        }
        .product-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">
        <i class="fas fa-shopping-bag cart-title-icon"></i> Sizning Savatchangiz
    </h2>
    <%
        User user = (User) session.getAttribute("user");
        List<Cart> cartItems = user != null ? (List<Cart>) session.getAttribute("cartItems_" + user.getId()) : null;
    %>
    <% if (cartItems != null && !cartItems.isEmpty()) { %>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th><i class="fas fa-box-open table-icon"></i> Mahsulot</th>
            <th><i class="fas fa-layer-group table-icon"></i> Miqdori</th>
            <th><i class="fas fa-tags table-icon"></i> Narxi</th>
            <th><i class="fas fa-calculator table-icon"></i> Jami</th>
            <th><i class="fas fa-cogs table-icon"></i> Amal</th>
        </tr>
        </thead>
        <tbody>
        <% double totalAmount = 0; %>
        <% for (Cart item : cartItems) { %>
        <tr>
            <td>
                <img src="<%= item.getProduct().getImageUrl() %>" alt="Mahsulot rasmi" class="product-image">
                <%= item.getProduct().getName() %>
            </td>
            <td class="action-buttons">
                <form action="/update-cart" method="post" style="display: inline;">
                    <input type="hidden" name="cartIndex" value="<%= cartItems.indexOf(item) %>">
                    <button type="submit" name="action" value="decrease" class="btn btn-sm btn-outline-secondary">
                        <i class="fas fa-minus-circle"></i>
                    </button>
                </form>
                <span class="mx-2"><%= item.getQuantity() %></span>
                <form action="/update-cart" method="post" style="display: inline;">
                    <input type="hidden" name="cartIndex" value="<%= cartItems.indexOf(item) %>">
                    <button type="submit" name="action" value="increase" class="btn btn-sm btn-outline-primary">
                        <i class="fas fa-plus-circle"></i>
                    </button>
                </form>
            </td>
            <td><i class="fas fa-money-bill-wave table-icon"></i><%= String.format("%,.0f", item.getProduct().getPrice()) %> UZS</td>
            <td><i class="fas fa-hand-holding-usd table-icon"></i><%= String.format("%,.0f", item.getQuantity() * item.getProduct().getPrice()) %> UZS</td>
            <td>
                <form action="/remove-from-cart" method="post">
                    <input type="hidden" name="cartIndex" value="<%= cartItems.indexOf(item) %>">
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash-alt"></i> O'chirish
                    </button>
                </form>
            </td>
        </tr>
        <% totalAmount += item.getQuantity() * item.getProduct().getPrice(); %>
        <% } %>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3" class="text-end"><strong>Jami</strong></td>
            <td colspan="2"><strong><i class="fas fa-coins"></i> <%= String.format("%,.0f", totalAmount) %> UZS</strong></td>
        </tr>
        </tfoot>
    </table>
    <form action="/views/payment-method.jsp" method="post">
        <button type="submit" class="btn btn-success w-100"><i class="fas fa-cash-register"></i> Buyurtma berish</button>
    </form>
    <% } else { %>
    <p class="text-center"><i class="fas fa-info-circle"></i> Sizning savatchangiz bo'sh.</p>
    <% } %>
    <div class="text-center mt-3">
        <a href="/products" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Mahsulotlarga qaytish</a>
    </div>
</div>
</body>
</html>
