/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.sql.Date;

/**
 *
 * @author adm
 */
public class ProductDTO {
    private String name, describe, classifyStr;
    private String[] image;
    private int id, quantity, starRating;
    private double price, discount, salePrice;
    private Date date;
    private String id_name;

    public ProductDTO() {
    }

    public ProductDTO(String name, String[] image, String describe, String classifyStr, 
            int id, int quantity, int starRating, double price, double discount, double salePrice,
            Date date, String id_name) {
        this.name = name;
        this.image = image;
        this.describe = describe;
        this.classifyStr = classifyStr;
        this.id = id;
        this.quantity = quantity;
        this.starRating = starRating;
        this.price = price;
        this.discount = discount;
        this.salePrice = salePrice;
        this.date = date;
        this.id_name = id_name;
    }  
    
    
    public ProductDTO(int id, String name, String[] image) {
        this.id = id;
        this.name = name;
        this.image = image;
    }

    public String getId_name() {
        return id_name;
    }

    public void setId_name(String id_name) {
        this.id_name = id_name;
    }
    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getClassifyStr() {
        return classifyStr;
    }

    public void setClassifyStr(String classifyStr) {
        this.classifyStr = classifyStr;
    }

    public String[] getImage() {
        return image;
    }

    public void setImage(String[] image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStarRating() {
        return starRating;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getDiscount() {
        return Math.round(discount * 100);
    }
    
    
    public double getSalePrice() {
        double salePrice = price - Math.round(price * discount * 100) / 100.0;
        salePrice = Math.round(salePrice * 100.0) / 100.0;
        if (discount > 0) {
            return salePrice;
        } else {
            return price;
        }
    }
}
