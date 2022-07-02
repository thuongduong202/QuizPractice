/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author fptshop
 */
public class QuestionWithRightOption {
    private int questionid;
    private int quizid;
    private String title;
    private int optionid;
    private String content;

    public QuestionWithRightOption(int questionid, int quizid, String title, int optionid, String content) {
        this.questionid = questionid;
        this.quizid = quizid;
        this.title = title;
        this.optionid = optionid;
        this.content = content;
    }

    public int getQuestionid() {
        return questionid;
    }

    public void setQuestionid(int questionid) {
        this.questionid = questionid;
    }

    public int getQuizid() {
        return quizid;
    }

    public void setQuizid(int quizid) {
        this.quizid = quizid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getOptionid() {
        return optionid;
    }

    public void setOptionid(int optionid) {
        this.optionid = optionid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "QuestionWithRightOption{" + "questionid=" + questionid + ", quizid=" + quizid + ", title=" + title + ", optionid=" + optionid + ", content=" + content + '}';
    }
    
}
