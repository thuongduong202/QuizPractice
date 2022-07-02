
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class OptionDAO {
    // insert option using questionid
    public boolean insertOption(int quizid, String questionid, String optionid, String content, boolean right) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "insert into [Option] (quizid, questionid,optionid,option_content,right_option)\n"
                + "values (?,?,?,?,?)";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizid);
            ps.setString(2, questionid);
            ps.setString(3, optionid);
            ps.setString(4, content);
            ps.setBoolean(5, right);
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

}
