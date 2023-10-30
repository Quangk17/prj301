/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class Cart {
    private Map<String, Laptop> cart;

    public Cart() {
    }

    public Cart(Map<String, Laptop> cart) {
        this.cart = cart;
    }

    public Map<String, Laptop> getCart() {
        return cart;
    }

    public void setCart(Map<String, Laptop> cart) {
        this.cart = cart;
    }
    
    public boolean add(Laptop laptop){
        boolean check = false;
        try {
            if(this.cart == null){
                this.cart = new HashMap<>();
            }
            if(this.cart.containsKey(laptop.getLaptopID())){
                int currentQuantity = this.cart.get(laptop.getLaptopID()).getQuantity();
                laptop.setQuantity(currentQuantity + laptop.getQuantity());
            }
            this.cart.put(laptop.getLaptopID(), laptop);
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return check;
        
    }
    
    public boolean remove(String id){
        boolean check = false;
        try {
            if(this.cart != null){
                if(this.cart.containsKey(id)){
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return check;
    }
    
    public boolean update(String id, Laptop newLaptop){
        boolean check = false;
        try {
            if(this.cart.containsKey(id)){
                this.cart.replace(id, newLaptop);
                check = true;
            }
        } catch (Exception e) {
        }
        return check;
        
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }
}
