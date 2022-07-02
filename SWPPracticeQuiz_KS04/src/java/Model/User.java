
package Model;


public class User {
    private int id;
    private String userName;
    private String passWord;
    private String email;
    private String aboutMe;
    private String phone;
    private String avatar;
    private int roleId;

    public User() {
    }

    public User(int id, String userName, String passWord, String email, String aboutMe, String phone, String avatar, int roleId) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
        this.aboutMe = aboutMe;
        this.phone = phone;
        this.avatar = avatar;
        this.roleId = roleId;
    }

    public User(int id, String userName, String email, String aboutMe, String phone, String avatar, int roleId) {
        this.id = id;
        this.userName = userName;
        this.email = email;
        this.aboutMe = aboutMe;
        this.phone = phone;
        this.avatar = avatar;
        this.roleId = roleId;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", userName=" + userName + ", passWord=" + passWord + ", email=" + email + ", aboutMe=" + aboutMe + ", phone=" + phone + ", avatar=" + avatar + ", roleId=" + roleId + '}';
    }
    
    
}
