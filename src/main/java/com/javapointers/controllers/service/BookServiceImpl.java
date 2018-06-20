package com.javapointers.controllers.service;

import com.javapointers.controllers.dao.BookDao;
import com.javapointers.controllers.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Override
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }

    @Override
    public List<Book> getAllBooksList() {
        return this.bookDao.getAllBooksList();
    }

    @Override
    public List<Book> searchBooks(String filterVal) {
        return this.bookDao.searchBooks(filterVal);
    }
}
