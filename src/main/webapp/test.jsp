<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test JSP - Trả về HTML</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .info-box {
            background-color: #e7f3ff;
            border-left: 4px solid #007bff;
            padding: 15px;
            margin: 10px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .form-group {
            margin: 15px 0;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>🚀 Test JSP - Trả về HTML</h1>
        <p>Ví dụ về cách JSP tạo HTML động cho người dùng</p>
    </header>

    <div class="container">
        <!-- Thông tin Server -->
        <div class="card">
            <h2>📊 Thông tin Server</h2>
            <div class="info-box">
                <p><strong>⏰ Thời gian hiện tại:</strong> <%= new java.util.Date() %></p>
                <p><strong>🖥️ Server:</strong> <%= request.getServerName() %></p>
                <p><strong>🔌 Port:</strong> <%= request.getServerPort() %></p>
                <p><strong>📁 Context Path:</strong> <%= request.getContextPath() %></p>
                <p><strong>🌐 Request URI:</strong> <%= request.getRequestURI() %></p>
            </div>
        </div>

        <!-- Form xử lý dữ liệu -->
        <div class="card">
            <h2>📝 Form nhập liệu</h2>
            <form method="post" action="test.jsp">
                <div class="form-group">
                    <label for="name">Tên của bạn:</label>
                    <input type="text" id="name" name="name" 
                           value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" 
                           placeholder="Nhập tên của bạn">
                </div>
                
                <div class="form-group">
                    <label for="age">Tuổi:</label>
                    <input type="number" id="age" name="age" 
                           value="<%= request.getParameter("age") != null ? request.getParameter("age") : "" %>" 
                           placeholder="Nhập tuổi">
                </div>
                
                <div class="form-group">
                    <label for="city">Thành phố:</label>
                    <select id="city" name="city">
                        <option value="">-- Chọn thành phố --</option>
                        <option value="Hà Nội" <%= "Hà Nội".equals(request.getParameter("city")) ? "selected" : "" %>>Hà Nội</option>
                        <option value="TP.HCM" <%= "TP.HCM".equals(request.getParameter("city")) ? "selected" : "" %>>TP.HCM</option>
                        <option value="Đà Nẵng" <%= "Đà Nẵng".equals(request.getParameter("city")) ? "selected" : "" %>>Đà Nẵng</option>
                        <option value="Hải Phòng" <%= "Hải Phòng".equals(request.getParameter("city")) ? "selected" : "" %>>Hải Phòng</option>
                    </select>
                </div>
                
                <button type="submit" class="btn">Gửi thông tin</button>
            </form>
        </div>

        <!-- Hiển thị kết quả -->
        <%
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String city = request.getParameter("city");
            
            if (name != null && !name.trim().isEmpty()) {
        %>
        <div class="card">
            <h2>✅ Kết quả đã nhập</h2>
            <div style="background-color: #d4edda; padding: 20px; border-radius: 5px; border-left: 4px solid #28a745;">
                <h3>👤 Thông tin cá nhân:</h3>
                <p><strong>Tên:</strong> <%= name %></p>
                <p><strong>Tuổi:</strong> <%= age != null && !age.trim().isEmpty() ? age + " tuổi" : "Chưa nhập" %></p>
                <p><strong>Thành phố:</strong> <%= city != null && !city.trim().isEmpty() ? city : "Chưa chọn" %></p>
                <p><strong>⏰ Thời gian gửi:</strong> <%= new java.util.Date() %></p>
            </div>
        </div>
        <%
            }
        %>

        <!-- Danh sách sản phẩm động -->
        <div class="card">
            <h2>🛍️ Danh sách sản phẩm</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Loại</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String[] products = {"iPhone 15 Pro", "Samsung Galaxy S24", "MacBook Pro M3", "Dell XPS 13", "iPad Air"};
                        double[] prices = {25000000, 20000000, 35000000, 25000000, 15000000};
                        String[] categories = {"Điện thoại", "Điện thoại", "Laptop", "Laptop", "Tablet"};
                        boolean[] inStock = {true, true, false, true, true};
                        
                        for (int i = 0; i < products.length; i++) {
                            String status = inStock[i] ? "Còn hàng" : "Hết hàng";
                            String statusClass = inStock[i] ? "color: green;" : "color: red;";
                    %>
                    <tr style="background-color: <%= i % 2 == 0 ? "#f8f9fa" : "white" %>;">
                        <td><%= i + 1 %></td>
                        <td><%= products[i] %></td>
                        <td style="text-align: right;"><%= String.format("%,.0f", prices[i]) %> VNĐ</td>
                        <td><%= categories[i] %></td>
                        <td style="<%= statusClass %> font-weight: bold;"><%= status %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Thống kê -->
        <div class="card">
            <h2>📈 Thống kê</h2>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">
                <div style="text-align: center; padding: 20px; background-color: #e3f2fd; border-radius: 8px;">
                    <h3 style="margin: 0; color: #1976d2;"><%= products.length %></h3>
                    <p style="margin: 5px 0 0 0;">Tổng sản phẩm</p>
                </div>
                <div style="text-align: center; padding: 20px; background-color: #e8f5e8; border-radius: 8px;">
                    <h3 style="margin: 0; color: #388e3c;">
                        <%
                            int inStockCount = 0;
                            for (boolean stock : inStock) {
                                if (stock) inStockCount++;
                            }
                            out.print(inStockCount);
                        %>
                    </h3>
                    <p style="margin: 5px 0 0 0;">Còn hàng</p>
                </div>
                <div style="text-align: center; padding: 20px; background-color: #fff3e0; border-radius: 8px;">
                    <h3 style="margin: 0; color: #f57c00;">
                        <%
                            double totalValue = 0;
                            for (double price : prices) {
                                totalValue += price;
                            }
                            out.print(String.format("%.0fM", totalValue / 1000000));
                        %>
                    </h3>
                    <p style="margin: 5px 0 0 0;">Tổng giá trị (VNĐ)</p>
                </div>
            </div>
        </div>

        <!-- JavaScript tương tác -->
        <div class="card">
            <h2>🎮 Tương tác JavaScript</h2>
            <button onclick="showMessage()" class="btn">Hiển thị thông báo</button>
            <button onclick="changeColor()" class="btn">Đổi màu nền</button>
            <button onclick="showTime()" class="btn">Hiển thị thời gian</button>
            
            <div id="message" style="margin-top: 20px; padding: 15px; background-color: #f8f9fa; border-radius: 5px; display: none;">
                <p id="messageText"></p>
            </div>
        </div>
    </div>

    <footer style="background-color: #343a40; color: white; text-align: center; padding: 20px; margin-top: 30px;">
        <p>&copy; 2024 - Test JSP Example. Được tạo bởi JSP!</p>
    </footer>

    <script>
        function showMessage() {
            document.getElementById('message').style.display = 'block';
            document.getElementById('messageText').innerHTML = 
                '🎉 Xin chào! Đây là thông báo từ JavaScript trong JSP.<br>' +
                '⏰ Thời gian: ' + new Date().toLocaleString('vi-VN');
        }
        
        function changeColor() {
            const colors = ['#ffebee', '#e8f5e8', '#e3f2fd', '#fff3e0', '#f3e5f5'];
            const randomColor = colors[Math.floor(Math.random() * colors.length)];
            document.body.style.backgroundColor = randomColor;
        }
        
        function showTime() {
            const now = new Date();
            alert('🕐 Thời gian hiện tại: ' + now.toLocaleString('vi-VN'));
        }
        
        // Cập nhật thời gian mỗi giây
        setInterval(function() {
            const now = new Date();
            const timeElement = document.getElementById('currentTime');
            if (timeElement) {
                timeElement.innerHTML = now.toLocaleString('vi-VN');
            }
        }, 1000);
    </script>

    <!-- Hiển thị thời gian real-time -->
    <div style="position: fixed; bottom: 20px; right: 20px; background-color: #007bff; color: white; padding: 15px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.3);">
        <strong>🕐 Thời gian:</strong><br>
        <span id="currentTime"></span>
    </div>
</body>
</html>