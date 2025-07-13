<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Feedback Collection System</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <style>
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Poppins', sans-serif;
    }
    body {
      background-image: url('./images/2.jpg');
      background-size: cover;
      background-position: center;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .overlay {
      background-color: transparent;
      border-radius: 15px;
      padding: 40px 60px;
      max-width: 1000px;
      width: 95%;
      text-align: center;
    }
    .heading-highlight span {
      background-color: #504A4B;
      color: #ffffff;
      padding: 0.25em 0.5em;
      border-radius: 4px;
      display: inline-block;
      font-size: 2rem;
      font-weight: 600;
    }
    .btn-custom {
      width: 200px;
      font-weight: 600;
      font-size: 1rem;        /* Reduced from 1.2rem to 1rem */
      border-radius: 8px;
      padding: 0.5rem 1rem;   /* Slightly less padding for balance */
    }
    .btn-primary {
      background-color: #3b82f6;
      border: none;
    }
    .btn-secondary {
      background-color: #6b7280;
      border: none;
    }
    .btn + .btn {
      margin-left: 15px;
    }
  </style>
</head>
<body>
  <div class="overlay">
    <h2 class="heading-highlight mb-4">
      <span>Welcome to the Feedback Collection System</span>
    </h2>
    <div class="d-flex justify-content-center gap-3">
      <a href="index2.jsp" class="btn btn-primary btn-custom">Submit Feedback</a>
      <a href="login" class="btn btn-secondary btn-custom">Admin Login</a>
    </div>
  </div>
</body>
</html>
