package DAO;

import Model.Category;
import Model.Option;
import Model.Question;
import Model.Quiz;
import Model.QuizUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {

    // get all own quiz in library
    public List<Quiz> getAllQuiz(int xUserid) throws SQLException {
        String query = "select * from [Quiz] where userid = ?";
        List<Quiz> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xUserid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt("quizid"), rs.getInt("userid"), rs.getString("title"),
                        rs.getString("Description"), rs.getDate("Date_Created"), rs.getDate("Last_update"));
                list.add(quiz);
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
        return list;
    }

    // get all quiz
    public List<QuizUser> getAllQuiz() throws SQLException {
        String query = "select u.username,q.*\n"
                + "from [user] u, quiz q\n"
                + "where u.userid = q.userid";
        List<QuizUser> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizUser quiz = new QuizUser(rs.getInt("quizid"), rs.getInt("userid"), rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("Description"), rs.getDate("Date_Created"), rs.getDate("Last_update"));
                list.add(quiz);
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
        return list;
    }

    // get all quiz by page and search
    public List<QuizUser> getAllQuizByPage(String index, String search) throws SQLException {
        String query = "select q.*, u.username from Quiz q join category_Quiz c\n"
                + "on q.quizid = c.quizid join Category t on \n"
                + "c.categoryid = t.categoryid join [User] u \n"
                + "on q.userid = u.userid where q.title like \n"
                + "? or t.category_name like ? order by q.quizid desc\n"
                + "offset ? row fetch next 6 row only";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            int page = Integer.parseInt(index);
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setInt(3, page * 6 - 6);
            rs = ps.executeQuery();
            List<QuizUser> list = new ArrayList<>();
            while (rs.next()) {
                QuizUser quizUser = new QuizUser(rs.getInt(1), rs.getInt(2), rs.getString(7), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getDate(6));
                list.add(quizUser);
            }
            return list;
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
        return null;
    }

    // count all quiz of search
    public int countAllQuizSearch(String search) throws SQLException {
        String query = "select count(*) from Quiz q join category_Quiz c\n"
                + "on q.quizid = c.quizid join Category t on\n"
                + "c.categoryid = t.categoryid \n"
                + "where q.title like ? or t.category_name like ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
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

    // get all quiz by page and search and category
    public List<QuizUser> getAllQuizByPageAndCategory(String index, String search, String category) throws SQLException {
        String query = "select q.*,u.username from Quiz q join category_Quiz c\n"
                + "on q.quizid = c.quizid join [User] u on q.userid = u.userid\n"
                + "where q.title like ? and \n"
                + "c.categoryid=? order by q.quizid desc\n"
                + "offset ? row fetch next 6 row only";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            int page = Integer.parseInt(index);
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, category);
            ps.setInt(3, page * 6 - 6);
            rs = ps.executeQuery();
            List<QuizUser> list = new ArrayList<>();
            while (rs.next()) {
                QuizUser quiz = new QuizUser(rs.getInt(1), rs.getInt(2), rs.getString(7), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getDate(6));
                list.add(quiz);
            }
            return list;
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
        return null;
    }

    // count all quiz by category and search
    public int countAllQuizByPageAndCategory(String search, String category) throws SQLException {
        String query = "select count(*) from Quiz q join category_Quiz c\n"
                + "on q.quizid = c.quizid where title like ? \n"
                + "and c.categoryid=? ";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, category);
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

    //get username by userid
    public String getUsernameByUserid(int userid) throws SQLException {
        String query = "select username from [User]"
                + "where userid = ?";
        List<QuizUser> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String userName = "";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                userName = rs.getString(1);
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
        return userName;
    }

    public List<QuizUser> getAllQuizByTitle(String title) throws SQLException {
        String query = "select u.username,q.*\n"
                + "from [user] u, quiz q\n"
                + "where u.userid = q.userid and q.title like'%" + title + "%'";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            List<QuizUser> list = new ArrayList<>();
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizUser quiz = new QuizUser(rs.getInt("quizid"), rs.getInt("userid"), rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("Description"), rs.getDate("Date_Created"), rs.getDate("Last_update"));
                list.add(quiz);
            }
            return list;
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
        return null;
    }

    // count total quiz in own library
    public int getTotalOwnQuiz(int xUserid, String search) throws SQLException {
        String query = "select count(*) from [Quiz] where userid = ? and title like ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int numOfQuiz = 0;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xUserid);
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                numOfQuiz = rs.getInt(1);
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
        return numOfQuiz;
    }

    // get total quiz select by userid and categoryid
    public int getTotalOwnQuizByCategory(int xUserid, String categoryid, String search) throws SQLException {
        String query = "select count(*) from Quiz q join category_Quiz c on q.quizid = c.quizid\n"
                + "where q.userid = ?  and c.categoryid = ? and q.title like ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int numOfQuiz = 0;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xUserid);
            ps.setString(2, categoryid);
            ps.setString(3, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                numOfQuiz = rs.getInt(1);
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
        return numOfQuiz;
    }

    // get other quiz of a user by userid and quizid
    public List<QuizUser> getListOtherQuizOfUser(String userid, String quizid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            String query = "select u.username, q.* from Quiz q join [User] u\n"
                    + "on q.userid = u.userid\n"
                    + "where q.userid=? and q.quizid not in (?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, userid);
            ps.setString(2, quizid);
            List<QuizUser> list = new ArrayList<>();
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizUser quizuser = new QuizUser(rs.getInt(3), rs.getInt(1), rs.getString(2), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getDate(8));
                list.add(quizuser);
            }
            return list;
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
        return null;
    }

    // get all own quiz in library with pagination
    public List<Quiz> quizPagination(int page, int xUserid) throws SQLException {
        List<Quiz> list = new ArrayList<>();
        String query = "select * from Quiz where userid=? order by quizid desc\n"
                + "offset ? row fetch next 6 row only";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xUserid);
            ps.setInt(2, (page - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getDate(6)));
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
        return list;
    }

    // get all own quiz in library with pagination
    public List<Quiz> quizPagination(int page, int xUserid, String search) throws SQLException {
        List<Quiz> list = new ArrayList<>();
        String query = "select * from Quiz where userid = ? \n"
                + "and title like ? order by quizid desc \n"
                + "offset ? row fetch next 6 row only";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xUserid);
            ps.setString(2, "%" + search + "%");
            ps.setInt(3, (page - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getDate(6)));
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
        return list;
    }

    // get all own quiz in library with pagination by category
//    public List<Quiz> quizPagination(int page, int xUserid, String categoryid) throws SQLException {
//        List<Quiz> list = new ArrayList<>();
//        String query = "select * from Quiz q join category_Quiz c on q.quizid = c.quizid\n"
//                + "where q.userid = ?  and c.categoryid = ? order by q.quizid desc\n"
//                + "        offset ? row fetch next 6 row only";
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        try {
//            conn = new DBContext().connection;
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, xUserid);
//            ps.setString(2, categoryid);
//            ps.setInt(3, (page - 1) * 6);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3),
//                        rs.getString(4), rs.getDate(5), rs.getDate(6)));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ps != null) {
//                ps.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return list;
//    }
    // get all own quiz in library with pagination by category
    public List<Quiz> quizPagination(int page, int xUserid, String categoryid, String search) throws SQLException {
        List<Quiz> list = new ArrayList<>();
        String query = "select * from Quiz q join category_Quiz c on q.quizid = c.quizid\n"
                + "where q.userid = ?  and c.categoryid = ? and q.title like ? order by q.quizid desc\n"
                + "        offset ? row fetch next 6 row only";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xUserid);
            ps.setString(2, categoryid);
            ps.setString(3, "%" + search + "%");
            ps.setInt(4, (page - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getDate(6)));
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
        return list;
    }

    // search quiz in library
    public List<Quiz> searchQuizInLibrary(int xUserid, String words) throws SQLException {
        List<Quiz> listBefore = getAllQuiz(xUserid);
        List<Quiz> listAfterSearch = new ArrayList<>();
        // loop for traverse all quiz in list quiz (library)
        for (int i = 0; i < listBefore.size(); i++) {
            if (listBefore.get(i).getTitle().toLowerCase().contains(words.toLowerCase())) {
                listAfterSearch.add(listBefore.get(i));
            }
        }
        return listAfterSearch;
    }

    public List<Quiz> searchQuizInLibrary2(int xUserid, String words) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select * from Quiz where userid = ?\n"
                + "and title like ?";
        try {
            List<Quiz> list = new ArrayList<>();
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xUserid);
            ps.setString(2, "%" + words + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz q = new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getDate(6));
                list.add(q);
            }
            return list;
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
        return null;
    }

    public String getTitleByQuizId(int xQuizid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "Select title from [Quiz] where quizid = ?";
        try {
            String xTitle = "";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xQuizid);
            rs = ps.executeQuery();
            while (rs.next()) {
                xTitle = rs.getString(1);
            }
            return xTitle;
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
        return null;
    }

    public List<Option> getAllOptions(int xQuestionId) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select optionid, option_content, right_option from  [Option] \n"
                + "where questionid = ? \n";
        try {
            List<Option> listOption = new ArrayList<>();
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, xQuestionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Option op = new Option(rs.getInt(1), rs.getString(2), rs.getBoolean(3));
                listOption.add(op);
            }
            return listOption;
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
        return null;
    }

    // insert into quiz table new quiz by userid
    public boolean insertNewQuizByUserid(int userid, String title, String description) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            String query = "insert into Quiz (userid, title, [Description],Date_Created)\n"
                    + "values (?,?,?, GETDATE())";
            ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
            ps.setString(2, title);
            ps.setString(3, description);
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

    // get last quiz create by userid
    public int getLassQuizByUser(int userid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select top 1* from Quiz where userid=? order by quizid desc";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
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

    // add category for quiz
    public boolean addQuiz_Category(String categoryid, int quizid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            String query = "insert into category_Quiz (categoryid, quizid) values (?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryid);
            ps.setInt(2, quizid);
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

    // check quiz exist bu quiz id
    public boolean checkQuizExist(String quizid) throws SQLException {
        String query = "select * from Quiz where quizid=?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, quizid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
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
        return false;
    }

    public List<QuizUser> getAllQuizByCategoryId(String id) throws SQLException {
        String query = "select q.*, u.username from quiz q, category_Quiz c,[user] u\n"
                + "                where q.quizid = c.quizid and u.userid = q.userid \n"
                + "				and c.categoryid = ? order by q.quizid desc";
        List<QuizUser> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizUser quiz = new QuizUser(rs.getInt("quizid"), rs.getInt("userid"), rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("Description"), rs.getDate("Date_Created"), rs.getDate("Last_update"));
                list.add(quiz);
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
        return list;
    }

    // get total question of quiz
    public int getNumOfQuestionInQuiz(String quizid) throws SQLException {
        String query = "select count(*) from Question where quizid=?";
        List<Quiz> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, quizid);
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

    // count number of option
    public int getNumOfOptionInQues(String quizid, int questionid) throws SQLException {
        String query = "select count(*) from [Option] where quizid=? and questionid=?";
        List<Quiz> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, quizid);
            ps.setInt(2, questionid);
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

    public Quiz getQuizDetails(String quizid) throws SQLException {
        String query = "select q.*, e.questionid, e.question_title, e.Intruction, \n"
                + "o.optionid, o.option_content, o.right_option, e.randomOption from Quiz q\n"
                + "join Question e on q.quizid = e.quizid\n"
                + "join [Option] o on o.quizid = q.quizid and \n"
                + "o.questionid = e.questionid where q.quizid=?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        QuizDAO dao = new QuizDAO();

        try {
            Quiz quiz = new Quiz();
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, quizid);
            rs = ps.executeQuery();
            int count = 0;
            int question = -1;

            while (rs.next()) {
                if (count == 0) {
                    quiz.setQuizid(rs.getInt(1));
                    quiz.setUserid(rs.getInt(2));
                    quiz.setTitle(rs.getString(3).trim());
                    quiz.setDescription(rs.getString(4).trim());
                    quiz.setDate_created(rs.getDate(5));
                    quiz.setLast_modified(rs.getDate(6));
                    count++;
                }
                if (rs.getInt(10) == 1) {
                    List<Question> list = quiz.getListQuestions();
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    question++;
                    list.add(new Question(rs.getInt(1), rs.getInt(7), rs.getString(8).trim(), rs.getString(9).trim(), "innerQuestion" + (question), rs.getBoolean(13)));
                    quiz.setListQuestions(list);

                }
                List<Option> listO = quiz.getListQuestions().get(question).getListOptions();
                if (listO == null) {
                    listO = new ArrayList<>();
                }
                listO.add(new Option(rs.getInt(10), rs.getString(11).trim(), rs.getBoolean(12), "que" + question + "_option" + rs.getInt(10)));
                quiz.getListQuestions().get(question).setListOptions(listO);
            }
            return quiz;

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
        return null;
    }

    public Question getQuestionDetails(String quizid, String questionid) throws SQLException {
        String query = "select q.quizid, e.questionid, e.question_title, e.Intruction,\n"
                + "                o.optionid, o.option_content, o.right_option from Quiz q\n"
                + "                join Question e on q.quizid = e.quizid\n"
                + "                join [Option] o on o.quizid = q.quizid and o.questionid = e.questionid\n"
                + "                where q.quizid=? and o.questionid=?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        QuizDAO dao = new QuizDAO();
        try {
            Question question = new Question();
            List<Option> listO = new ArrayList<>();
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, quizid);
            ps.setString(2, questionid);
            rs = ps.executeQuery();
            int count = 0;
            int option = -1;
            while (rs.next()) {
                if (count == 0) {
                    question.setQuizid(rs.getInt(1));
                    question.setQuestionid(rs.getInt(2));
                    question.setTitle(rs.getString(3));
                    question.setIntruction(rs.getString(4));
                    count++;
                }
                listO.add(new Option(rs.getInt(5), rs.getString(6), rs.getBoolean(7)));
                option++;
                question.setListOptions(listO);
            }
            return question;

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
        return null;
    }

    // get category of quiz
    public List<Category> getCategoryOfQuiz(String quizid) throws SQLException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            int n = 0;
            String query = "select * from Category";
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
            String query2 = "select categoryid from category_Quiz where quizid=?";
            ps = conn.prepareStatement(query2);
            ps.setString(1, quizid);
            rs = ps.executeQuery();
            for (int i = 0; i < list.size(); i++) {
                list.get(i).setCateOfQuiz(false);
            }
            while (rs.next()) {
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getCategoryId() == rs.getInt(1)) {
                        list.get(i).setCateOfQuiz(true);
                    }
                }
            }
            return list;
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
        return null;
    }

    // delete quiz by quizid
    public boolean deleteQuiz(String quizid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            String query = "delete [Option] where quizid=?\n"
                    + "delete Question where quizid=?\n"
                    + "delete category_Quiz where quizid=?\n"
                    + "delete Quiz where quizid = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, quizid);
            ps.setString(2, quizid);
            ps.setString(3, quizid);
            ps.setString(4, quizid);
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

    // delete quiz for Update by quizid
    public boolean deleteQuizDetailForEditQuiz(String quizid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            String query = "delete [Option] where quizid=?\n"
                    + "delete Question where quizid=?\n"
                    + "delete category_Quiz where quizid=?\n";
            ps = conn.prepareStatement(query);
            ps.setString(1, quizid);
            ps.setString(2, quizid);
            ps.setString(3, quizid);
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

    // update time update of quiz by quizid
    public boolean updateQuizInQuizTable(String quizid, String title, String description) throws SQLException {
        String query = "update Quiz set Last_update= GETDATE()\n"
                + ", title = ? , [Description]=? where quizid=?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, quizid);
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

    public static void main(String[] args) throws SQLException {
        QuizDAO q = new QuizDAO();
        List list = q.getAllQuiz(1);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }
        System.out.println(q.getTotalOwnQuiz(1, ""));

        List list2 = q.quizPagination(1, 1);
        for (int i = 0; i < list2.size(); i++) {
            System.out.println(list2.get(i).toString());
        }
        System.out.println("=====check search=====");
        List list3 = q.searchQuizInLibrary(1, "ja");
        for (int i = 0; i < list3.size(); i++) {
            System.out.println(list3.get(i).toString());
        }

        System.out.println("=====check get title by quizid=====");
        System.out.println(q.getTitleByQuizId(3));
        // List list = q.getAllQuiz(1);
        // for (int i = 0; i < list.size(); i++) {
        // System.out.println(list.get(i).toString());
        // }
        // System.out.println(q.getTotalOwnQuiz(1));
        //
        // List list2 = q.quizPagination(1, 1);
        // for (int i = 0; i < list2.size(); i++) {
        // System.out.println(list2.get(i).toString());
        // }
        // System.out.println("=====check search=====");
        // List list3 = q.searchQuizInLibrary(1, "ja");
        // for (int i = 0; i < list3.size(); i++) {
        // System.out.println(list3.get(i).toString());
        // }
        // System.out.println("=====check view quiz detail=====");
        // List list4 = q.viewQuizDetail(6);
        // for (int i = 0; i < list4.size(); i++) {
        // System.out.println(list4.get(i).toString());
        // }
        Question question = q.getQuestionDetails("1", "2");
        System.out.println(question.toString());
        System.out.println(q.getUsernameByUserid(1));
        System.out.println("--------------------------");
        System.out.println(q.getTotalOwnQuiz(2, ""));
        System.out.println(q.quizPagination(1, 2).size());
        System.out.println("-------------------");
        System.out.println(q.getAllQuizByPage("1", "te").get(0));
    }
}
