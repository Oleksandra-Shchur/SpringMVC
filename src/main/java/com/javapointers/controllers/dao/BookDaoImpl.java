package com.javapointers.controllers.dao;

import com.javapointers.controllers.model.Book;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class BookDaoImpl implements BookDao {
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("Book succesfully added. Book = " + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book succesfully update. Book = " + book);
    }

    @Override
    public void removeBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (book != null) {
            session.delete(book);
            logger.info("Book successfully deleted. Book = " + book);
        } else logger.info("Invalid id");
    }

    @Override
    public Book getBookById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (book != null) {
            logger.info("Book successfully get. Book = " + book);
            return book;
        } else {
            logger.info("Invalid id");
            return null;
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> getAllBooksList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Book");
        List<Book> bookList = query.list();

        for (Book book : bookList)
            logger.info("Book list : " + book);
        return bookList;
    }

    @Override
    public List<Book> searchBooks(String filterVal) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Book.class);

        if (filterVal != null && !filterVal.isEmpty()) {
            criteria.add((Restrictions.like("description", filterVal, MatchMode.ANYWHERE)));
        }

        return criteria.list();
    }
}
