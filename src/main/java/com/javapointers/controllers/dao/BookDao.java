package com.javapointers.controllers.dao;

import com.javapointers.controllers.model.Book;

import java.util.List;


public interface BookDao {
    void addBook(Book book);

    void updateBook(Book book);

    void removeBook(int id);

    Book getBookById(int id);

    List<Book> getAllBooksList();

    List<Book> searchBooks(String filterVal);
}
