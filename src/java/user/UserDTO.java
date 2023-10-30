/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author ASUS
 */
public class UserDTO {
    private String userID;
    private String password;
    private String roleID;
    private String fullName;
    private String status;

    public UserDTO() {
        userID = "";
        password = "";
        roleID = "";
        fullName = "";
        status = "";
    }

    public UserDTO(String userID, String password, String roleID, String fullName, String status) {
        this.userID = userID;
        this.password = password;
        this.roleID = roleID;
        this.fullName = fullName;
        this.status = status;
    }

    public UserDTO(String userID, String roleID, String fullName) {
        this.userID = userID;
        this.roleID = roleID;
        this.fullName = fullName;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
