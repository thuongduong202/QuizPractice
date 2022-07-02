/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class QuestionDAO {
    // insert question into question table by quizid
    public boolean insertNewQuestion(int quizid, String questionid, String title, String Intruction, boolean randomOption) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "insert into Question (quizid,questionid,question_title,Intruction ,randomOption)\n" +
"                    values (?,?,?,?,?)";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizid);
            ps.setString(2, questionid);
            ps.setString(3, title);
            ps.setString(4, Intruction);
            ps.setBoolean(5, randomOption);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    // get last question using quizid
    public int getLastQuestion(int quizid) throws SQLException {
        String query = "select top 1 * from Question where quizid=? order by questionid desc";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

}
