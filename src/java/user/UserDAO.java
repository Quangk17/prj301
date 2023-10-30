/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class UserDAO {
    private static final String LOGIN  = "SELECT fullName, roleID, status  from tblUsers WHERE userID=? AND password=?";
    private static final String SEARCH  = "SELECT fullName, roleID, status, userID  from tblUsers WHERE fullName LIKE ? ORDER BY [userID] OFFSET 10*? ROWS FETCH NEXT 10 ROWS ONLY";
    private static final String DELETE  = "DELETE FROM tblUsers WHERE userID=?";
    private static final String UPDATE  = "UPDATE tblUsers SET fullName=?, roleID=? WHERE userID=?";
    private static final String CHECK_DUPLICATE  = "SELECT roleID from tblUsers WHERE userID = ?";
    private static final String INSERT = "INSERT INTO tblUsers(userID, fullName, roleID, password, status)" + "VALUES(?,?,?,?,1)";
    
    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO loginUser = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ps = conn.prepareStatement(LOGIN);
                ps.setString(1, userID);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if(rs.next()){
                    String roleID = rs.getString("roleID");
                    String fullName = rs.getString("fullName");
                    String status = rs.getString("status");
                    loginUser = new UserDTO(userID, "****", roleID, fullName, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
        return loginUser;
    }
    public static List<UserDTO> getListUser(String search, String pageNumber) throws SQLException{
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
          conn = DBUtils.getConnection();
          if(conn != null){
              ps = conn.prepareStatement(SEARCH);
              ps.setString(1, "%"+search+"%");
              ps.setString(2, ""+(Integer.parseInt(pageNumber)-1));
              rs = ps.executeQuery();
              while(rs.next()){
                    String userID = rs.getString("userID");
                    String roleID = rs.getString("roleID");
                    String fullName = rs.getString("fullName");
                    String status = rs.getString("status");
                    UserDTO newUser = new UserDTO(userID, "****", roleID, fullName, status);
                    listUser.add(newUser);
              }
          }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
        return listUser;
    }

    public boolean delete(String userID) throws SQLException {
        boolean isDeleted = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ps = conn.prepareStatement(DELETE);
                ps.setString(1, userID);
                isDeleted = ps.executeUpdate()> 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ps!=null) ps.close();
            if(conn!=null); conn.close();
        }
        return isDeleted;
    }

    public boolean update(UserDTO user) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!=null){
                ps = conn.prepareStatement(UPDATE);
                ps.setString(1, user.getFullName());
                ps.setString(2, user.getRoleID());
                ps.setString(3, user.getUserID());
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

      public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insert(UserDTO user) throws SQLException, ClassNotFoundException{
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                checkInsert = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception ex) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkInsert;
    }
}   
