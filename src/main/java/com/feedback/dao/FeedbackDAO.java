
package com.feedback.dao;
import com.feedback.model.Feedback;
import com.feedback.util.DBConnection;
import java.sql.*;
import java.util.*;

public class FeedbackDAO {
  public void saveFeedback(Feedback f) throws SQLException {
    String sql = "INSERT INTO feedback(name,rating,comments) VALUES(?,?,?)";
    try (Connection c=DBConnection.getConnection();
         PreparedStatement ps=c.prepareStatement(sql)) {
      ps.setString(1,f.getName());
      ps.setInt(2,f.getRating());
      ps.setString(3,f.getComments());
      ps.executeUpdate();
    }
  }

  public List<Feedback> getAll(String filter) throws SQLException {
    String sql="SELECT * FROM feedback";
    if("reviewed".equals(filter)) sql+=" WHERE reviewed=TRUE";
    else if("unreviewed".equals(filter)) sql+=" WHERE reviewed=FALSE";
    sql+=" ORDER BY submitted_at DESC";
    List<Feedback> list=new ArrayList<>();
    try (Connection c=DBConnection.getConnection();
         Statement s=c.createStatement();
         ResultSet rs=s.executeQuery(sql)) {
      while(rs.next()) {
        Feedback f=new Feedback();
        f.setId(rs.getInt("id"));
        f.setName(rs.getString("name"));
        f.setRating(rs.getInt("rating"));
        f.setComments(rs.getString("comments"));
        f.setReviewed(rs.getBoolean("reviewed"));
        f.setSubmittedAt(rs.getTimestamp("submitted_at"));
        list.add(f);
      }
    }
    return list;
  }

  public void markReviewed(int id) throws SQLException {
    String sql="UPDATE feedback SET reviewed=TRUE WHERE id=?";
    try (Connection c=DBConnection.getConnection();
         PreparedStatement ps=c.prepareStatement(sql)) {
      ps.setInt(1,id);
      ps.executeUpdate();
    }
  }
}

