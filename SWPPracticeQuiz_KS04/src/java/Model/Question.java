package Model;

import java.util.List;

public class Question {

    private int quizid;
    private int questionid;
    private String title;
    private String intruction;
    private List<Option> listOptions;
    private String classQuestion;
    private boolean randomQuestion;
    public Question() {
    }

    public Question(int quizid, int questionid, String title, String intruction, String classQuestion) {
        this.quizid = quizid;
        this.questionid = questionid;
        this.title = title;
        this.intruction = intruction;
        this.classQuestion = classQuestion;
    }

    public Question(int quizid, int questionid, String title, String intruction, String classQuestion, boolean randomQuestion) {
        this.quizid = quizid;
        this.questionid = questionid;
        this.title = title;
        this.intruction = intruction;
        this.classQuestion = classQuestion;
        this.randomQuestion = randomQuestion;
    }
    
    public String getRightAnswer() {
        String answer = "";
        for (int i = 0; i < listOptions.size(); i++) {
            if (listOptions.get(i).isRight_option() == true) {
                answer += listOptions.get(i).getContent();
                answer+= "\n";
            }
        }
        return answer;
    }

    public Question(int quizid, int questionid, String title, String intruction, List<Option> listOptions) {
        this.quizid = quizid;
        this.questionid = questionid;
        this.title = title;
        this.intruction = intruction;
        this.listOptions = listOptions;
    }

    public Question(int quizid, int questionid, String title, String intruction) {
        this.quizid = quizid;
        this.questionid = questionid;
        this.title = title;
        this.intruction = intruction;
    }

    public int getQuizid() {
        return quizid;
    }

    public void setQuizid(int quizid) {
        this.quizid = quizid;
    }

    public int getQuestionid() {
        return questionid;
    }

    public void setQuestionid(int questionid) {
        this.questionid = questionid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIntruction() {
        return intruction;
    }

    public void setIntruction(String intruction) {
        this.intruction = intruction;
    }

    public List<Option> getListOptions() {
        return listOptions;
    }

    public void setListOptions(List<Option> listOptions) {
        this.listOptions = listOptions;
    }

    public String getClassQuestion() {
        return classQuestion;
    }

    public void setClassQuestion(String classQuestion) {
        this.classQuestion = classQuestion;
    }

    public boolean isRandomQuestion() {
        return randomQuestion;
    }

    public void setRandomQuestion(boolean randomQuestion) {
        this.randomQuestion = randomQuestion;
    }
    
    @Override
    public String toString() {
        return "Question{" + "quizid=" + quizid + ", questionid=" + questionid + ", title=" + title + ", intruction="
                + intruction + '}';
    }

}
