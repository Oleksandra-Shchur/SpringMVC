package com.javapointers.controllers.service;

import com.javapointers.controllers.model.Book;

import java.util.List;


public interface BookService {
    void addBook(Book book);

    void updateBook(Book book);

    void removeBook(int id);

    Book getBookById(int id);

    List<Book> getAllBooksList();

    List<Book> searchBooks(String filterVal);
}
