/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import dao.CategoriesDAO;
import dtos.ProductDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import sample.utils.DBUtils;

public class ProductDAO extends DBUtils {

    private static final String ALL = "select * from Products";
    private static final String SEARCH_PRICE = "SELECT * FROM Products WHERE (UnitPrice * ( 1 - Discount)) BETWEEN ? AND ?";
    private static final String SEARCH = "SELECT * FROM Products WHERE ProductName like ?";
    private static final String SORT_LOW = "SELECT * FROM Products ORDER BY (UnitPrice * ( 1 - Discount)) ASC";
    private static final String SORT_HIGH = "SELECT * FROM Products ORDER BY (UnitPrice * ( 1 - Discount)) DESC";
    private static final String SORT_NAME = "SELECT * FROM Products ORDER BY ProductName";
    private static final String SORT_YEAR = "SELECT * FROM Products ORDER BY releaseDate";
    private static final String RATING_1 = "SELECT * FROM Products WHERE StarRating > 0";
    private static final String RATING_2 = "SELECT * FROM Products WHERE StarRating > 1";
    private static final String RATING_3 = "SELECT * FROM Products WHERE StarRating > 2";
    private static final String RATING_4 = "SELECT * FROM Products WHERE StarRating > 3";
    private static final String RATING_5 = "SELECT * FROM Products WHERE StarRating = 5";
    private static final String GETID2 = "SELECT * FROM Products WHERE ProductID = ?";
    private static final String getProductByID = "SELECT * FROM Products WHERE ProductID = ?";
    private static final String getCategoriesID = "select c.name , p.ProductID , p.ProductName, p.UnitPrice, p.describe, "
            + "p.QuantityPerUnit, p.image from Products p inner join "
            + "Categories c on p.id = c.id WHERE p.id = ?";
    private static final String countProduct = "SELECT COUNT(*) as 'count'\n"
            + "  FROM Products";
    private static final String countUser = "SELECT COUNT(*) as 'count 'FROM users where isAdmin = 'False' or isAdmin = 'FALSE'";
    private static final String countBill = "SELECT COUNT(*) as 'count'  FROM bill";
    private static final String countProductLow = "SELECT COUNT(*) as 'count' FROM Products where QuantityPerUnit < 50 ";
    private static final String DIENTHOAI = "select * from Products where id = 'Dien thoai' ";
    private static final String AOTHUN = "select * from Products where id = 'Ao thun' ";
    private static final String DONGHO = "select * from Products where id = 'Dong ho' ";
    private static final String DELETE = "delete Products where ProductID = ?";
    private static final String UPDATE = "update Products set id=?, ProductName=?, UnitPrice=?, describe=?, discount=?, QuantityPerUnit=? where ProductID = ?";

    private CategoriesDAO cd = new CategoriesDAO();
    private DecimalFormat df = new DecimalFormat("###.##");

    public List<ProductDTO> getAll() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> getID(int product_id) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETID2);
                ptm.setInt(1, product_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));

                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> getListPrice(double priceFrom, double priceTo) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRICE);
                ptm.setDouble(1, priceFrom);
                ptm.setDouble(2, priceTo);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ProductDTO getProductByID(int product_id) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getProductByID);
                ptm.setInt(1, product_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<ProductDTO> sortLow() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SORT_LOW);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> sortByDay() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SORT_YEAR);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> sortHigh() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SORT_HIGH);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> sortName() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SORT_NAME);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> getListSearch(String search) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));

                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> rating1() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RATING_1);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> rating2() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RATING_2);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> rating3() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RATING_3);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> rating4() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RATING_4);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> rating5() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RATING_5);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> getListByPage(List<ProductDTO> list, int start, int end) {
        ArrayList<ProductDTO> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<ProductDTO> DIENTHOAI() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DIENTHOAI);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> AOTHUN() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(AOTHUN);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductDTO> DONGHO() {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DONGHO);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    String[] images = image.split(",");
                    String id_name = rs.getString("id");
                    double salePrice = getSalePrice(rs.getDouble("UnitPrice"), rs.getDouble("Discount"));
                    String name = rs.getString("ProductName");
                    String describe = rs.getString("describe");
                    String classifyStr = rs.getString("QuantityPerUnit");
                    int id = rs.getInt("ProductID");
                    int quantity = rs.getInt("QuantitySold");
                    int starRating = rs.getInt("StarRating");
                    double price = rs.getDouble("UnitPrice");
                    double discount = rs.getDouble("Discount");
                    Date date = rs.getDate("releaseDate");
                    list.add(new ProductDTO(name, images, describe, classifyStr, id, quantity, starRating, price, discount, salePrice, date, id_name));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public double getSalePrice(double price, double discount) {
        double result = price - (price * discount);
        String str = df.format(result);
        try {
            result = Double.parseDouble(str);
        } catch (Exception e) {
        }

        return result;
    }

    public int CountProduct() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(countProduct);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountUser() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(countUser);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountBill() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(countBill);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountProductLow() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(countProductLow);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return count;
    }

    public void ProductDelete(int product_id) {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, product_id);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void UpdateProduct(int ProductID, String id_name, String name, double price, String describe, float discount,
            String quantity, String image) {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE Products SET id=? , ProductName = ?, UnitPrice = ?, describe=?, discount =?, QuantityPerUnit =?, "
                + "image =? WHERE ProductID=?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, id_name);
                ptm.setString(2, name);
                ptm.setDouble(3, price);
                ptm.setString(4, describe);
                ptm.setFloat(5, discount);
                ptm.setString(6, quantity);
                ptm.setString(7, image);
                ptm.setInt(8, ProductID);

                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void InsertProduct(String name, String id_name, String quantity, double price, int rate, String image, String describe, float discount) {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "insert into Products (ProductName, id, "
                + "QuantityPerUnit, UnitPrice, StarRating, image, describe, Discount) "
                + "values (?,?,?,?,?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, name);
                ptm.setString(2, id_name);
                ptm.setString(3, quantity);
                ptm.setDouble(4, price);
                ptm.setInt(5, rate);
                ptm.setString(6, image);
                ptm.setString(7, describe);
                ptm.setFloat(8, discount);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
