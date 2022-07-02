
package Model;

import java.sql.Date;
import java.util.List;


public class Quiz {
    private int quizid;
    private int userid;
    private String title;
    private String description;
    private Date date_created;
    private Date last_modified;
    private List<Question> listQuestions;
    private List<Category> listCategory;
    public Quiz() {
    }
    

    public Quiz(int quizid, int userid, String title, String description, Date date_created, Date last_modified, List<Question> listQuestions) {
        this.quizid = quizid;
        this.userid = userid;
        this.title = title;
        this.description = description;
        this.date_created = date_created;
        this.last_modified = last_modified;
        this.listQuestions = listQuestions;
    }
    
    public Quiz(int quizid, int userid, String title, String description, Date date_created, Date last_modified) {
        this.quizid = quizid;
        this.userid = userid;
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

    public List<Question> getListQuestions() {
        return listQuestions;
    }

    public void setListQuestions(List<Question> listQuestions) {
        this.listQuestions = listQuestions;
    }

    public List<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }
    
    @Override
    public String toString() {
        return "Quiz{" + "quizid=" + quizid + ", userid=" + userid + ", title=" + title + ", description=" + description + ", date_created=" + date_created + ", last_modified=" + last_modified + '}';
    }
    
}
