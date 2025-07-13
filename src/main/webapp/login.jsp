<!DOCTYPE html>
<html>
<head>
  <title>Admin Login</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .login-card {
      background: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
      width: 100%;
      max-width: 400px;
    }
  </style>
</head>
<body>
<div class="login-card">
  <h3 class="text-center mb-4">Admin Login</h3>
  <form action="login" method="post">
    <div class="mb-3">
      <label class="form-label">Username</label>
      <input type="text" name="username" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <% if ("true".equals(request.getParameter("error"))) { %>
      <div class="alert alert-danger">Invalid credentials</div>
    <% } %>
    <div class="d-grid">
      <button type="submit" class="btn btn-dark">Login</button>
    </div>
  </form>
</div>
</body>
</html>