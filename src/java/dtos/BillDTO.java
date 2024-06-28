/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import dtos.UserDTO;
import java.sql.Date;

public class BillDTO {
    int bill_id;
    UserDTO user;
    Float total;
    String address;
    Date date;
    int phone;

    public BillDTO() {
    }   

    public BillDTO(int bill_id, UserDTO user, Float total, String address, Date date, int phone) {
        this.bill_id = bill_id;
        this.user = user;
        this.total = total;
        this.address = address;
        this.date = date;
        this.phone = phone;
    }
    
    public BillDTO(int bill_id,Float total,Date date) {
        this.bill_id = bill_id;
        this.total = total;
        this.date = date;
    }

    public BillDTO(int bill_id, Float total, String address, Date date, int phone) {
        this.bill_id = bill_id;
        this.total = total;
        this.address = address;
        this.date = date;
        this.phone = phone;
    }
    
    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
    
    
}
