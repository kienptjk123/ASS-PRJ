/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dtos.BillDetailDTO;
import dtos.BillDTO;
import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import dtos.Item;
import dtos.ProductDTO;
import sample.utils.DBUtils;

public class billDAO extends DBUtils {

    private static final String INSERTBILL = "insert into [bill] values(?,?,?,?,?)";
    private static final String TOPBILL = "select top 1 bill_id from [bill] order by bill_id desc";
    private static final String INSERTBILLDETAIL = "insert into [bill_detail] values(?,?,?,?)";
    private static final String UPDATEQUANTITY = "update product set quantity = quantity - ? "
            + "where product_id = ?";
    private static final String BILLINFO = "select b.bill_id, u.user_name,b.phone,b.address,b.date,b.total from bill b inner join users u on b.user_id = u.user_id";
    private static final String getBILL = "select top 1 bill_id, total, date from [bill] order by bill_id desc";
    private static final String getBillID = "select b.bill_id, b.date, b.total, b.address, b.phone from bill b where user_id = ?";
    private static final String GETDETAIL = "select d.detail_id, p.ProductID, p.ProductName, p.image, d.quantity, d.price from bill_detail d "
            + "inner join Products p on d.product_id = p.ProductID where d.bill_id = ?";

    private static final String getBillByDay = "select b.bill_id, u.user_name,b.phone,b.address,b.date,b.total from bill b inner join users u on b.user_id = u.user_id where date = cast(getdate() as Date)";

    public void addOrder(UserDTO u, CartProduct cart, String address, int phone) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERTBILL);
                ptm.setInt(1, u.getUser_id());
                ptm.setDouble(2, cart.getTotalMoney());
                ptm.setString(3, address);
                ptm.setString(4, date);
                ptm.setInt(5, phone);
                ptm.executeUpdate();

                ptm = conn.prepareStatement(TOPBILL);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    int bill_id = rs.getInt(1);
                    for (Item i : cart.getItems()) {
                        double total = i.getQuantity() * i.getProduct().getPrice();
                        ptm = conn.prepareStatement(INSERTBILLDETAIL);
                        ptm.setInt(1, bill_id);
                        ptm.setInt(2, i.getProduct().getId());
                        ptm.setInt(3, i.getQuantity());
                        ptm.setDouble(4, total);
                        ptm.executeUpdate();
                    }
                }

                ptm = conn.prepareStatement(UPDATEQUANTITY);
                for (Item i : cart.getItems()) {
                    ptm.setInt(1, i.getQuantity());
                    ptm.setInt(2, i.getProduct().getId());
                    ptm.executeUpdate();
                }
            }

        } catch (Exception e) {
        }
    }
//select b.bill_id, u.user_name,b.phone,b.address,b.date,b.total from bill 
//        b inner join users u on b.user_id = u.user_id"
    public List<BillDTO> getBillInfo() {
        List<BillDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(BILLINFO);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    UserDTO u = new UserDTO(rs.getString(2));
                    list.add(new BillDTO(rs.getInt(1), u, rs.getFloat(6), rs.getString(4), rs.getDate(5), rs.getInt(3)));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public BillDTO getBill() {
        List<BillDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getBILL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return (new BillDTO(rs.getInt(1), rs.getFloat(2), rs.getDate(3)));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

//private static final String GETDETAIL = "select d.detail_id, p.ProductID, p.ProductName, "
//     + "p.image, d.quantity, d.price from bill_detail d "
//   "inner join Productsproduct p on d.product_id = p.ProductID where d.bill_id = ?";
    public List<BillDetailDTO> getDetail(int bill_id) {
        List<BillDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETDETAIL);
                ptm.setInt(1, bill_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    int id = rs.getInt("ProductID");
                    String name = rs.getString("ProductName");
                    ProductDTO p = new ProductDTO(id, name, images);
                    //int detail_id, ProductDTO product, int quantity, Float price               
                    list.add(new BillDetailDTO(rs.getInt(1), p, rs.getInt(5), rs.getFloat(6)));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
//
//    public void updatePayment(String payment, int bill_id) {
//        String sql = "update bill set payment= ? where bill_id = ?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setInt(2, bill_id);
//            ps.setString(1, payment);
//            ps.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
//

    public List<BillDTO> getBillByID(int user_id) {
        List<BillDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getBillID);
                ptm.setInt(1, user_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new BillDTO(rs.getInt(1), rs.getFloat(3), rs.getString(4), rs.getDate(2), rs.getInt(5)));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<BillDTO> getBillByDay() {
        List<BillDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getBillByDay);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    UserDTO u = new UserDTO(rs.getString(2));
                    list.add(new BillDTO(rs.getInt(1), u, rs.getFloat(6), rs.getString(4), rs.getDate(5), rs.getInt(3)));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
}
