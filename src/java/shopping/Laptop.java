/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

public class Laptop {
    private String laptopID;
    private String name;
    private double price;
    private int quantity;
    private String imageUrl;
    private int isDeleted;

    public Laptop() {
         this.laptopID = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.imageUrl = "";
        this.isDeleted = 0;
    }

    public Laptop(String laptopID, String name, double price, int quantity, String imageUrl, int isDeleted) {
        this.laptopID = laptopID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.isDeleted = isDeleted;
    }

    public String getLaptopID() {
        return laptopID;
    }

    public void setLaptopID(String laptopID) {
        this.laptopID = laptopID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }
    
    
}
