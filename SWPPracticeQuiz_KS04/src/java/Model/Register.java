/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author dangm
 */
public class Register {
    private String userName;
    private String password;
    private String email;
    private String phone;
    private int role_id;
    private String code;

    public Register() {
    }

    public Register(String userName, String password, String email, String phone, int role_id, String code) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.role_id = role_id;
        this.code = code;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "Register{" + "userName=" + userName + ", password=" + password + ", email=" + email + ", phone=" + phone + ", role_id=" + role_id + ", code=" + code + '}';
    }

    
    
   
    
    
    
}
