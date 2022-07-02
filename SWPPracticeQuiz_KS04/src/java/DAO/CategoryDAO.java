/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.spi.DirStateFactory;

/**
 *
 * @author MSI
 */
public class CategoryDAO {

    public List<Category> getAllCategory() throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
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

    public static void main(String[] args) throws SQLException {
        CategoryDAO dao = new CategoryDAO();
        List<Category> list = dao.getAllCategory();
        list.forEach((category) -> {
            System.out.print(category);
        });
    }
}
