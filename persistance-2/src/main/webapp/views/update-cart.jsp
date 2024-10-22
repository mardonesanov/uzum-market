<%@ page import="uz.app.persistance2.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.app.persistance2.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Shopping Cart</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    body {
      background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
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
    .btn-danger {
      background: #dc3545;
      border: none;
      transition: background 0.4s, transform 0.4s;
    }
    .btn-danger:hover {
      background: #c82333;
      transform: translateY(-5px);
    }
    .btn-success {
      background: #28a745;
      border: none;
      transition: background 0.4s, transform 0.4s;
    }
    .btn-success:hover {
      background: #218838;
      transform: translateY(-5px);
    }
    .btn-secondary {
      transition: background 0.4s, transform 0.4s;
    }
    .btn-secondary:hover {
      background: #6c757d;
      transform: translateY(-5px);
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center mb-4"><i class="fas fa-shopping-cart"></i> Your Shopping Cart</h2>
  <%
    User user = (User) session.getAttribute("user");
    List<Cart> cartItems = user != null ? (List<Cart>) session.getAttribute("cartItems_" + user.getId()) : null;
  %>
  <% if (cartItems != null && !cartItems.isEmpty()) { %>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th><i class="fas fa-box"></i> Product</th>
      <th><i class="fas fa-sort-numeric-up"></i> Quantity</th>
      <th><i class="fas fa-tag"></i> Price</th>
      <th><i class="fas fa-dollar-sign"></i> Total</th>
      <th><i class="fas fa-cogs"></i> Action</th>
    </tr>
    </thead>
    <tbody>
    <% double totalAmount = 0; %>
    <% for (Cart item : cartItems) { %>
    <tr>
      <td><i class="fas fa-box-open"></i> <%= item.getProduct().getName() %></td>
      <td>
        <form action="/update-cart" method="post" style="display: inline;">
          <input type="hidden" name="cartIndex" value="<%= cartItems.indexOf(item) %>">
          <button type="submit" name="action" value="decrease" class="btn btn-sm btn-outline-secondary"><i class="fas fa-minus"></i></button>
        </form>
        <%= item.getQuantity() %>
        <form action="/update-cart" method="post" style="display: inline;">
          <input type="hidden" name="cartIndex" value="<%= cartItems.indexOf(item) %>">
          <button type="submit" name="action" value="increase" class="btn btn-sm btn-outline-primary"><i class="fas fa-plus"></i></button>
        </form>
      </td>
      <td><i class="fas fa-dollar-sign"></i> <%= String.format("%,.0f", item.getProduct().getPrice()) %> UZS</td>
      <td><i class="fas fa-calculator"></i> <%= String.format("%,.0f", item.getQuantity() * item.getProduct().getPrice()) %> UZS</td>
      <td>
        <form action="/remove-from-cart" method="post">
          <input type="hidden" name="cartIndex" value="<%= cartItems.indexOf(item) %>">
          <button type="submit" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Remove</button>
        </form>
      </td>
    </tr>
    <% totalAmount += item.getQuantity() * item.getProduct().getPrice(); %>
    <% } %>
    </tbody>
    <tfoot>
    <tr>
      <td colspan="3" class="text-end"><strong>Total</strong></td>
      <td colspan="2"><strong><i class="fas fa-dollar-sign"></i> <%= String.format("%,.0f", totalAmount) %> UZS</strong></td>
    </tr>
    </tfoot>
  </table>
  <form action="/checkout" method="post">
    <button type="submit" class="btn btn-success w-100"><i class="fas fa-credit-card"></i> Checkout</button>
  </form>
  <% } else { %>
  <p class="text-center"><i class="fas fa-shopping-cart"></i> Your cart is empty.</p>
  <% } %>
  <div class="text-center mt-3">
    <a href="/products" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back to Products</a>
    <a href="/cart" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Go to Cart</a>
  </div>
</div>
</body>
</html>
