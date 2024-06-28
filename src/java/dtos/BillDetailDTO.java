/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import dtos.ProductDTO;

public class BillDetailDTO {
    int detail_id;
    int bill_id;
    ProductDTO product;
    int quantity;
    Float price;

    public BillDetailDTO() {
    }

    public BillDetailDTO(int detail_id, int bill_id, ProductDTO product, int quantity, Float price) {
        this.detail_id = detail_id;
        this.bill_id = bill_id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }
    
    public BillDetailDTO(int detail_id, ProductDTO product, int quantity, Float price) {
        this.detail_id = detail_id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    
    
}
