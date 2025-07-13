# 📑 Feedback Collection System

A simple Java web application to collect, manage, and review user feedback. Built with JSP, Servlets, and MySQL, the system allows users to submit feedback while providing an admin panel for viewing and marking feedback as reviewed.

---

## 📂 Project Structure

```
FeedbackCollectionSystem/
├── src/main/java/com/feedback/
│   ├── controller/       # Servlets (AdminLogin, SubmitFeedback, etc.)
│   ├── dao/              # Data Access Object for database interaction
│   ├── model/            # Feedback data model
│   └── util/             # Database connection utility
├── src/main/webapp/
│   ├── images/           # Image assets
│   ├── WEB-INF/lib/      # External libraries (MySQL Connector)
│   ├── *.jsp             # JSP pages for frontend
│   └── META-INF/         # Manifest and deployment descriptor
├── build/                # Compiled classes
└── .settings/            # Eclipse project settings
```

---

## 🚀 Features

- 📬 User feedback submission form  
- 🔐 Admin login functionality  
- 📊 Admin panel to view and mark feedback as reviewed  
- 📖 Simple, clean JSP frontend  
- 📦 MySQL database integration using JDBC  

---

## ⚙️ Technologies Used

- Java (JSP & Servlets)
- MySQL Database
- JDBC (mysql-connector-j)
- Eclipse IDE project structure
- HTML, CSS for frontend

---

## 🖥️ Installation & Setup

### Prerequisites

- Java Development Kit (JDK)
- Apache Tomcat Server
- MySQL Server (using MySQL Workbench or CLI)
- Eclipse IDE (or any Java EE compatible IDE)

### Steps

1. **Clone or extract the project.**
2. **Import the project into Eclipse** as an existing Dynamic Web Project.
3. **Configure MySQL Database:**

   Open **MySQL Workbench** and run the following SQL script:

   ```sql
   CREATE DATABASE feedback_system;
   USE feedback_system;

   CREATE TABLE feedback (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
       comments TEXT,
       reviewed BOOLEAN DEFAULT FALSE,
       submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );

   -- View inserted feedback records
   SELECT * FROM feedback;
   ```

4. **Update `DBConnection.java`** with your database connection credentials:

   ```java
   String url = "jdbc:mysql://localhost:3306/feedback_system";
   String username = "root";
   String password = "your_password";
   ```

5. **Ensure the MySQL JDBC Driver** (`mysql-connector-j-9.3.0.jar`) is placed inside `WEB-INF/lib/` and added to your project’s build path.
6. **Deploy the project on Apache Tomcat** and access it via your browser.

---

## 📝 Key Java Files

- `AdminLogin.java` — Handles admin authentication.
- `SubmitFeedback.java` — Captures user feedback.
- `AdminView.java` — Displays all submitted feedback to the admin.
- `MarkReviewed.java` — Allows marking feedback as reviewed.
- `DBConnection.java` — Manages database connection.
- JSP Pages — Frontend templates (`index.jsp`, `login.jsp`, `thankyou.jsp`, etc.)

---

## 📸 Screenshots

*(You can optionally add screenshots of your interface here for clarity.)*

---

## 📌 License

This project is for academic/learning purposes and may be modified for personal or educational use.
