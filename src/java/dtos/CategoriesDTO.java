/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author adm
 */
public class CategoriesDTO {

    private String id;
    private String name;
    private ArrayList<ProductDTO> product = new ArrayList<>();

    public CategoriesDTO(String id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public CategoriesDTO(String name) {
        this.name = name;
    }

    public ArrayList<ProductDTO> getProduct() {
        return product;
    }

    public void setProduct(ArrayList<ProductDTO> product) {
        this.product = product;
    }
    
     public CategoriesDTO() {
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
//    public int getTotalProduct() {
//        int total = 0;
//        ProductDAO p = new ProductDAO();
//        List<ProductDTO> list = p.getProductsByCategoryid(this.id);
//        for (int i = 0; i < list.size(); i++) {
//            total += 1;
//        }
//        return total;
//    }
    
}
