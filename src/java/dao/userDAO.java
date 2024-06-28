/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

public class userDAO extends DBUtils {

    private static final String CHECK = "select * from users where user_email = ? and user_pass = ?";
    private static final String UPDATEUSER = "update users set user_name =? , user_pass = ? where user_id = ?";
    private static final String CHECKACC = "select * from users where user_email = ?";
    private static final String SIGNUP = "insert into users values(?,?,?,?)";
    private static final String GETUSER = "select * from users";
    private static final String SETADMIN = "update users set isAdmin= ? where user_id = ?";
    private static final String DELETE = "DELETE users WHERE user_id= ?";
    private static final String UPDATE = "update users set user_name=?, user_email=?, user_pass=? where user_id = ? ";

    public UserDTO checkUser(String user_email, String user_pass) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK);
                ptm.setString(1, user_email);
                ptm.setString(2, user_pass);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    UserDTO user = new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                    return user;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateUser(int user_id, String user_name, String user_pass) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEUSER);;
                ptm.setString(1, user_name);
                ptm.setString(2, user_pass);
                ptm.setInt(3, user_id);
                rs = ptm.executeQuery();
            }
        } catch (Exception e) {
        }
    }

    public UserDTO checkAcc(String user_email) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECKACC);
                ptm.setString(1, user_email);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    UserDTO a = new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                    return a;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user_email, String user_pass) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SIGNUP);
                ptm.setString(1, "");
                ptm.setString(2, user_email);
                ptm.setString(3, user_pass);
                ptm.setString(4, "False");
                ptm.executeUpdate();
            }
        } catch (Exception e) {
        };
    }

    public List<UserDTO> getUser() {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETUSER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new UserDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void setAdmin(int user_id, String isAdmin) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SETADMIN);
                ptm.setInt(2, user_id);
                ptm.setString(1, isAdmin.toUpperCase());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public void delete(int user_id) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, user_id);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    //  "update users set user_id=? user_name=?, user_email=?, user_pass=? where user_id = ? ";
    public void update(int user_id, String user_name, String user_email, String user_pass) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);;
                ptm.setString(1, user_name);
                ptm.setString(2, user_email);
                ptm.setString(3, user_pass);
                ptm.setInt(4, user_id);
                rs = ptm.executeQuery();
            }
        } catch (Exception e) {
        }
    }

}
