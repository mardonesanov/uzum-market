<%@ page import="uz.app.persistance2.entity.History" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sotib olingan mahsulotlar tarixi</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnH2N2IbWgD9+bb9OPkA9C/rXHgtPpvhijVgXu5cSz0EjJ6/gCwXM6HZH8pI7QJ9hrTwH1LQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvuVDSn13_q-hqHcOZvpfMCqVRxDSijbadyA&s');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      margin: 0;
      padding: 0;
      color: #000;
    }

    h2 {
      text-align: center;
      margin: 20px 0;
      color: #000;
      font-size: 32px;
      text-shadow: none;
    }

    .container {
      max-width: 900px;
      margin: 50px auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      animation: fadeIn 1s ease-in-out;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 15px;
      text-align: left;
      color: #000;
    }

    th {
      background-color: #3498db;
      color: white;
      font-size: 18px;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:nth-child(odd) {
      background-color: #e6e6e6;
    }

    td {
      border-bottom: 1px solid #ddd;
      font-size: 16px;
    }

    .icon {
      margin-right: 10px;
    }

    a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #3498db;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      text-align: center;
      margin-top: 20px;
      transition: background-color 0.3s ease-in-out;
    }

    a:hover {
      background-color: #2980b9;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h2><i class="fas fa-history icon"></i> Sotib olingan mahsulotlar tarixi</h2>

  <% List<History> historyItems = (List<uz.app.persistance2.entity.History>) request.getAttribute("historyItems"); %>
  <% if (historyItems == null || historyItems.isEmpty()) { %>
  <p><i class="fas fa-exclamation-circle"></i> Tarix mavjud emas. Yakunlashga vaqt bo'lmadi.</p>
  <% } else { %>
  <table>
    <thead>
    <tr>
      <th><i class="fas fa-box"></i> Mahsulot</th>
      <th><i class="fas fa-sort-amount-up"></i> Miqdor</th>
      <th><i class="fas fa-dollar-sign"></i> Umumiy narx</th>
      <th><i class="fas fa-map-marker-alt"></i> Yetkazib berish manzili</th>
    </tr>
    </thead>
    <tbody>
    <% for (uz.app.persistance2.entity.History history : historyItems) { %>
    <tr>
      <td><i class="fas fa-cube"></i> <%= history.getProduct().getName() %></td>
      <td><i class="fas fa-hashtag"></i> <%= history.getQuantity() %></td>
      <td><i class="fas fa-money-bill-wave"></i> $<%= history.getTotalPrice() %></td>
      <td><i class="fas fa-map-marker"></i> <%= history.getDeliveryAddress() %></td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } %>

  <a href="/products"><i class="fas fa-shopping-cart"></i> Xaridni davom ettiring</a>
</div>
</body>
</html>
