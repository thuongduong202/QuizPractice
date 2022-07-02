
package Model;

public class Option {
    private int optionid;
    private String content;
    private boolean right_option;
    private String que_Option;
    public Option() {
    }

    public Option(int optionid, String content, boolean right_option) {
        this.optionid = optionid;
        this.content = content;
        this.right_option = right_option;
    }

    public Option(int optionid, String content, boolean right_option, String que_Option) {
        this.optionid = optionid;
        this.content = content;
        this.right_option = right_option;
        this.que_Option = que_Option;
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

    public boolean isRight_option() {
        return right_option;
    }

    public void setRight_option(boolean right_option) {
        this.right_option = right_option;
    }

    public String getQue_Option() {
        return que_Option;
    }

    public void setQue_Option(String que_Option) {
        this.que_Option = que_Option;
    }
    
    @Override
    public String toString() {
        return "Option{" + "optionid=" + optionid + ", content=" + content + ", right_option=" + right_option + '}';
    }
    
}
