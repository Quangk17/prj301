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
public class UserError {
    private String userIDError;
    private String passwordError;
    private String roleIDError;
    private String fullNameError;
    private String statusError;
    private String confirmError;
    private String error;

    public UserError() {
        this.userIDError = "";
        this.passwordError = "";
        this.roleIDError = "";
        this.fullNameError = "";
        this.statusError = "";
        this.confirmError ="";
        this.error ="";
    }

    public UserError(String userIDError, String passwordError, String roleIDError, String fullNameError, String statusError, String confirmError, String error) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.roleIDError = roleIDError;
        this.fullNameError = fullNameError;
        this.statusError = statusError;
        this.confirmError = confirmError;
        this.error = error;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
    
}
