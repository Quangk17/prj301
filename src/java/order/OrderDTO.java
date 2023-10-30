/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class OrderDTO {
    private int orderID;
    private String userID;
    private Date orderDate;
    private BigDecimal total;

    public OrderDTO() {
        orderID = 0;
        userID = "";
        orderDate = null;
        total = null;
    }

    public OrderDTO(int orderID, String userID, Date orderDate, BigDecimal total) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
    
    
}
