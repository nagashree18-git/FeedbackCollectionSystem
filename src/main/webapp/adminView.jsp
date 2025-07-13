<%@ page import="java.util.*, com.feedback.model.Feedback" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp?error=true");
        return;
    }
    List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
    feedbacks.sort(Comparator.comparingInt(Feedback::getId));
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <script>
    function filterTable() {
      const filter = document.getElementById('filterSelect').value;
      const rows = document.querySelectorAll("#feedbackTable tbody tr");
      rows.forEach(row => {
        row.style.display = (filter === "all" || row.dataset.reviewed === filter) ? "" : "none";
      });
    }

    window.onload = () => {
      filterTable();
    };
  </script>
  <style>
    body {
      background: #f4f6fa;
      font-family: 'Poppins', sans-serif;
    }
    .header-box {
      background: linear-gradient(to right, #c1dfc4, #deecdd);
      color: #1e293b;
      border-radius: 12px;
      padding: 30px;
      margin-top: 30px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .table-box {
      background: white;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.05);
      margin-top: 20px;
    }
    .btn-logout {
      border-radius: 8px;
      background-color: #ef4444;
      color: white;
      font-weight: 500;
      border: none;
    }
    .table thead {
      background-color: #64748b;
      color: white;
    }
    .badge-status {
      font-size: 0.9rem;
      padding: 0.4em 0.6em;
      border-radius: 5px;
    }
    .table-hover tbody tr:hover {
      background-color: #eef2ff;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header-box d-flex justify-content-between align-items-center">
    <h2 class="mb-0">Admin Feedback Dashboard</h2>
    <div>
      <span class="badge bg-light text-dark me-3">Total Feedbacks: <%= feedbacks.size() %></span>
      <a href="logout" class="btn btn-logout">Logout</a>
    </div>
  </div>
  <div class="table-box">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h5 class="mb-0">Feedback List</h5>
      <select id="filterSelect" class="form-select w-auto" onchange="filterTable()">
        <option value="all">All</option>
        <option value="true">Reviewed</option>
        <option value="false">Pending</option>
      </select>
    </div>
    <div class="table-responsive">
      <table class="table table-bordered table-hover text-center align-middle" id="feedbackTable">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Rating</th>
            <th>Comments</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <% for (Feedback f : feedbacks) {
               String rowClass = f.isReviewed() ? "" : "table-warning";
               String reviewedValue = f.isReviewed() ? "true" : "false";
          %>
            <tr class="<%= rowClass %>" data-reviewed="<%= reviewedValue %>">
              <td><%= f.getId() %></td>
              <td><%= f.getName() %></td>
              <td><%= f.getRating() %></td>
              <td><%= f.getComments() %></td>
              <td>
                <% if (f.isReviewed()) { %>
                  <span class="badge bg-success badge-status">Reviewed</span>
                <% } else { %>
                  <span class="badge bg-warning text-dark badge-status">Pending</span>
                <% } %>
              </td>
              <td>
                <% if (!f.isReviewed()) { %>
                  <form action="markReviewed" method="post" class="d-inline">
                    <input type="hidden" name="id" value="<%= f.getId() %>" />
                    <button type="submit" class="btn btn-sm btn-outline-success">Mark Reviewed</button>
                  </form>
                <% } else { %>
                  <span class="text-muted">Reviewed</span>
                <% } %>
              </td>
            </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
