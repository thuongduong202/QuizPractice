package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    // register
    public void register(String user_name,
            String password, String email, String phone) throws SQLException {
        String query = "insert into [User](username,password,email,phone,role_id) "
                + "Values(?,?,?,?,0)";
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, user_name);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        } finally {

            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }

    // check if user exsist by email return user
    public User checkAccountExist(String email) throws SQLException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select * from [User] where email =?";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setEmail(email);
                return u;
            }

        } catch (SQLException e) {
            System.out.println(e);
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
        return null;
    }

    public User getUserForLogin(String xName, String xPass) throws SQLException {
        String query = "select * from [User] where email = ? and [password] = ?";
        User x = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, xName);
            ps.setString(2, xPass);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = new User(rs.getInt("userid"), rs.getString("username"), rs.getString("password"),
                        rs.getString("email"), rs.getString("aboutme"), rs.getString("phone"),
                        rs.getString("avatar"), rs.getInt("role_id"));
                return x;
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
        return x;
    }

    // get user by email return user
    public User getUser(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = new User();
        try {
            String query = "select * from [User] where email =?";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setId(rs.getInt(1));
                if (rs.getString(2) != null) {
                    u.setUserName(rs.getString(2).trim());
                } else {
                    u.setUserName(rs.getString(2));
                }
                if (rs.getString(3) != null) {
                    u.setPassWord(rs.getString(3).trim());
                } else {
                    u.setPassWord(rs.getString(3));
                }
                if (rs.getString(4) != null) {
                    u.setEmail(rs.getString(4).trim());
                } else {
                    u.setEmail(rs.getString(4));
                }
                if (rs.getString(5) != null) {
                    u.setAboutMe(rs.getString(5).trim());
                } else {
                    u.setAboutMe(rs.getString(5));
                }
                if (rs.getString(6) != null) {
                    u.setPhone(rs.getString(6).trim());
                } else {
                    u.setPhone(rs.getString(6));
                }

                if (rs.getString(7) != null) {
                    u.setAvatar(rs.getString(7).trim());
                } else {
                    u.setAvatar(rs.getString(7));
                }
                u.setRoleId(rs.getInt(8));
                return u;
            }

        } catch (SQLException e) {
            System.out.println(e);
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
        return null;
    }

    // check account exsist by username and password
    public int checkAccount(String username, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int n = 0;
        String sql = "select * from [User] where username=? and password=?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                n = 1;
            } else {
                n = -1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
        return n;
    }

    // update password using userid
    public int changePassword(String pass, int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int n = 0;
        String sql = "Update [User] set password=? where userid=?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
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
        return n;
    }

    // update password using email and new password
    public boolean resetPassword(String email, String newpass) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "update [User] set password=? where email=?";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, newpass);
            ps.setString(2, email);
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

    // Update information of user by id
    public boolean updateUserInformation(int id, String username, String aboutme, String phone) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "Update [User] set username=? , aboutme=?, phone=? where userid=?";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, aboutme);
            ps.setString(3, phone);
            ps.setInt(4, id);
            ps.executeUpdate();
            return true;
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
        return false;
    }

    // change avatar using userid return true/false
    public boolean changeAvatar(String id, String image) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "update [User] set avatar= ? where userid=?";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, image);
            ps.setString(2, id);
            ps.executeUpdate();
            return true;
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
        return false;
    }

    public boolean updateAvatar(String id, String avatar) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
//        String query = " update [User]\n"
//                + "  set avatar = ?\n"
//                + "  where user_id =?;";
        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, avatar);
//            ps.setString(2, id);
//            ps.executeUpdate();
            String query = " update [User]\n"
                    + "  set avatar = ?\n"
                    + "  where userid =?;";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, avatar);
            ps.setString(2, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println(e);
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
        return true;
    }

//    public User getUserById(String id) {
////        User u = new User();
////        String query = "select * from [User] where userid = ?";
//        User u = new User();
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        try {
////            PreparedStatement pd = connection.prepareStatement(query);
////            pd.setString(1, email);
////            ResultSet rs = pd.executeQuery();
//
//            String query = "select * from [User] where userid = ?";
//            conn = new DBContext().connection;
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                u = new User(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getInt(8)
//                );
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return u;
//    }
    // get user by email return user
    public User getUserById(String id) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = new User();
        try {
            String query = "select * from [User] where userid =?";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setId(rs.getInt(1));
                if (rs.getString(2) != null) {
                    u.setUserName(rs.getString(2).trim());
                } else {
                    u.setUserName(rs.getString(2));
                }
                if (rs.getString(3) != null) {
                    u.setPassWord(rs.getString(3).trim());
                } else {
                    u.setPassWord(rs.getString(3));
                }
                if (rs.getString(4) != null) {
                    u.setEmail(rs.getString(4).trim());
                } else {
                    u.setEmail(rs.getString(4));
                }
                if (rs.getString(5) != null) {
                    u.setAboutMe(rs.getString(5).trim());
                } else {
                    u.setAboutMe(rs.getString(5));
                }
                if (rs.getString(6) != null) {
                    u.setPhone(rs.getString(6).trim());
                } else {
                    u.setPhone(rs.getString(6));
                }

                if (rs.getString(7) != null) {
                    u.setAvatar(rs.getString(7).trim());
                } else {
                    u.setAvatar(rs.getString(7));
                }
                u.setRoleId(rs.getInt(8));
                return u;
            }

        } catch (SQLException e) {
            System.out.println(e);
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
        return null;
    }

    public static void main(String[] args) throws SQLException {

        UserDAO u = new UserDAO();
        User us = u.getUserForLogin("muibdhe153351@fpt.edu.vn", "12345678");
        System.out.println(us);
//        User us = u.checkAccountExist("mui@gmail.com");
//        System.out.println(us);
//        System.out.println(u.resetPassword("thuongdthe150682@fpt.edu.vn", "th"));
//        System.out.println(u.checkAccountExist("thuongdthe150682@fpt.edu.vn").getAvatar());
//        u.updateUserInformation(1, "thuongdt", "love sleeping", "0111222333");
    }

    public ResultSet getData(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
