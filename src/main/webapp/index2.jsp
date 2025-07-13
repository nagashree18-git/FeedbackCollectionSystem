<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
  <title>Submit Feedback</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card shadow p-4">
        <h3 class="mb-4 text-center">Submit Your Feedback</h3>

        <form action="submit" method="post">
          <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" required class="form-control" placeholder="Your name"/>
          </div>
          <div class="mb-3">
            <label class="form-label">Rating (1-5)</label>
            <select name="rating" class="form-select" required>
              <option value="">Select Rating</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label">Comments</label>
            <textarea name="comments" rows="4" class="form-control" required></textarea>
          </div>
          <div class="d-grid">
            <button class="btn btn-primary" type="submit">Submit Feedback</button>
          </div>
        </form>

      </div>
    </div>
  </div>
</div>

</body>
</html>