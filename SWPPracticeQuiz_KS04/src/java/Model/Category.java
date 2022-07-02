/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author MSI
 */
public class Category {
    private int categoryId;
    private String categoryName;
    private boolean cateOfQuiz;
    public Category() {
    }

    public Category(int categoryId, String categoryName, boolean cateOfQuiz) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.cateOfQuiz = cateOfQuiz;
    }
    
    
    public Category(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isCateOfQuiz() {
        return cateOfQuiz;
    }

    public void setCateOfQuiz(boolean cateOfQuiz) {
        this.cateOfQuiz = cateOfQuiz;
    }
    
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryName=" + categoryName + '}';
    }

    
}
