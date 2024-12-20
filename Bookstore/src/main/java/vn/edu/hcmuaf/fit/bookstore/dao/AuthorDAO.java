package vn.edu.hcmuaf.fit.bookstore.dao;

import vn.edu.hcmuaf.fit.bookstore.beans.Author;

import java.util.ArrayList;

public class AuthorDAO {
    private ArrayList<Author> data = new ArrayList<>();

    public AuthorDAO(ArrayList<Author> data) {
        this.data = data;
    }
}
