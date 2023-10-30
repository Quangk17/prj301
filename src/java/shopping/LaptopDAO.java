/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import user.UserDTO;
import utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class LaptopDAO {
    private static final String UPDATE_PRODUCT = "UPDATE tblProducts SET name=?, price=?, quantity=?, imageUrl=? WHERE productID=?";
    
    public static Cart getListProduct(String search) throws SQLException{
        String GET_LIST_PRODUCT  = "SELECT [productID],[name],[quantity],[price], [imageUrl], [isDeleted] FROM [tblProducts] where isDeleted = 0";
        Cart cart = new Cart();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        if(!search.equals("")){
            GET_LIST_PRODUCT += (" and name LIKE " + "'%"+search+"%'");
        }
        
        try {
          conn = DBUtils.getConnection();
          if(conn != null){
              ps = conn.prepareStatement(GET_LIST_PRODUCT);
              rs = ps.executeQuery();
              while(rs.next()){
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    double price = Double.parseDouble(rs.getString("price"));
                    String imageUrl = rs.getString("imageUrl");
                    int isDeleted = rs.getInt("isDeleted");
                    Laptop laptop = new Laptop(productID, name, price, quantity, imageUrl, isDeleted);
                    cart.add(laptop);
              }
          }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
        return cart;
    }

    public boolean update(Laptop laptop) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ps = conn.prepareStatement(UPDATE_PRODUCT);
                ps.setString(1, laptop.getName());
                ps.setString(2,""+ laptop.getPrice());
                ps.setString(3, ""+laptop.getQuantity());
                ps.setString(4, ""+laptop.getImageUrl());
                ps.setString(5, ""+laptop.getLaptopID());
                checkUpdate = ps.executeUpdate()> 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ps!=null) ps.close();
            if(conn!=null); conn.close();
        }
        return checkUpdate;
    }
    
    public boolean delete(String productID) throws SQLException {
        final String DELETE_PRODUCT = "UPDATE tblProducts SET isDeleted=1 WHERE productID=?";
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ps = conn.prepareStatement(DELETE_PRODUCT);
                ps.setString(1, productID);
                checkUpdate = ps.executeUpdate()> 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ps!=null) ps.close();
            if(conn!=null); conn.close();
        }
        return checkUpdate;
    }

    public boolean addLaptop(Laptop laptop) throws SQLException {
        final String ADD_LAPTOP = "INSERT INTO [tblProducts] ([productID], [name], [quantity], [price], [imageUrl], [isDeleted]) VALUES  (?, ?, ?, ?, ?, 0) ";
        boolean check = false;
         Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ps = conn.prepareStatement(ADD_LAPTOP);
                ps.setString(1, laptop.getLaptopID());
                ps.setString(2, laptop.getName());
                ps.setInt(3, laptop.getQuantity());
                ps.setString(4, laptop.getPrice() +"");
                ps.setString(5, laptop.getImageUrl());
                check = ps.executeUpdate()> 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ps!=null) ps.close();
            if(conn!=null); conn.close();
        }
        return      check;   
    }
    
    
}
