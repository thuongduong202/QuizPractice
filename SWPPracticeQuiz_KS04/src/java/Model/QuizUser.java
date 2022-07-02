/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author MSI
 */
public class QuizUser {
    private int quizid;
    private int userid;
    private String username;
    private String title;
    private String description;
    private Date date_created;
    private Date last_modified;

    public QuizUser() {
    }

    public QuizUser(int quizid, int userid, String username, String title, String description, Date date_created, Date last_modified) {
        this.quizid = quizid;
        this.userid = userid;
        this.username = username;
        this.title = title;
        this.description = description;
        this.date_created = date_created;
        this.last_modified = last_modified;
    }

    public int getQuizid() {
        return quizid;
    }

    public void setQuizid(int quizid) {
        this.quizid = quizid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public Date getLast_modified() {
        return last_modified;
    }

    public void setLast_modified(Date last_modified) {
        this.last_modified = last_modified;
    }

    @Override
    public String toString() {
        return "QuizUser{" + "quizid=" + quizid + ", userid=" + userid + ", username=" + username + ", title=" + title + ", description=" + description + ", date_created=" + date_created + ", last_modified=" + last_modified + '}';
    }
    

}
