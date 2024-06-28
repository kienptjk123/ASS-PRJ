/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dtos.CategoriesDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author adm
 */
public class CategoriesDAO extends DBUtils {

    private static final String LIST = "SELECT * FROM Categories";
    private static final String ID = "SELECT * FROM Categories where id = ?";

    public List<CategoriesDTO> getList() {
        List<CategoriesDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    list.add(new CategoriesDTO(id, name));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }


    public CategoriesDTO getCategoryById(String id) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ID);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    CategoriesDTO c = new CategoriesDTO();
                    c.setId(rs.getString("id"));
                    c.setName(rs.getString("name"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

}
