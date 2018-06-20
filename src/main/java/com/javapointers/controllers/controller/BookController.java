package com.javapointers.controllers.controller;

import com.javapointers.controllers.model.Book;
import com.javapointers.controllers.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@Controller
public class BookController {

    private BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/")
    public String getIndexPage() {
        return "index";
    }

    @GetMapping("/books")
    public String listBooks(@RequestParam(value = "page", defaultValue = "0", required = false) int page,
                            @RequestParam Map<String, String> allRequestParams,
                            Model model) {

        if (allRequestParams.isEmpty()) allRequestParams.put("page", Integer.toString(page));

        List<Book> allBooks = bookService.getAllBooksList();
        PagedListHolder<Book> booksPages = new PagedListHolder<>(allBooks);
        booksPages.setPageSize(5);
        booksPages.setPage(page);
        String nextPageRequest = pageRequestModifier(allRequestParams, page + 1);
        String prevPageRequest = pageRequestModifier(allRequestParams, page - 1);
        model.addAttribute("nextPageRequest", nextPageRequest);
        model.addAttribute("prevPageRequest", prevPageRequest);
        model.addAttribute("booksPages", booksPages);
        return "books";
    }

    @PostMapping(value = "/add")
    public String addAction(@ModelAttribute("book") Book book, Model model) {

        if (book.getTitle() == null || book.getTitle().isEmpty() ||
                book.getAuthor() == null || book.getAuthor().isEmpty() ||
                book.getDescription() == null || book.getDescription().isEmpty() ||
                book.getIsbn() == null || book.getIsbn().isEmpty() ||
                book.getPrintYear() < 0) {
            model.addAttribute("isInvalidArguments", true);
            model.addAttribute("book", book);
            return "addForm";
        }
        bookService.addBook(book);
        return "redirect:/books";
    }

    @GetMapping("/addBook")
    public String addBook(Model model) {
        model.addAttribute("book", new Book());
        return "addForm";
    }

    @RequestMapping("/remove={id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @GetMapping("/edit={id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", bookService.getBookById(id));

        return "editForm";
    }

    @GetMapping("/read={id}")
    public String readBook(@PathVariable("id") int id, Model model) {
        Book book = bookService.getBookById(id);
        if (!book.isReadAlready())
            book.setReadAlready(true);
        bookService.updateBook(book);

        return "redirect:/books";
    }

    @PostMapping("/update")
    public String updateBook(@ModelAttribute("book") Book book, Model model) {

        if (book.getTitle() == null || book.getAuthor().isEmpty() || book.getPrintYear() < 0) {
            model.addAttribute("isInvalidArguments", true);
            model.addAttribute("book", book);
            return "editForm";
        }

        bookService.updateBook(book);
        return "redirect:/books";
    }

    @GetMapping("/search")
    public String searchRequestHandler(
                                       @RequestParam("filerVal") String filerVal,
                                       @RequestParam(value = "page", defaultValue = "0") int page,

                                       @RequestParam Map<String, String> allRequestParams,
                                       Model model) {

        List<Book> resultList = bookService.searchBooks(filerVal);

        PagedListHolder<Book> booksPages = new PagedListHolder<Book>(resultList);
        booksPages.setPageSize(5);
        booksPages.setPage(page);
        String nextPageRequest = pageRequestModifier(allRequestParams, page + 1);
        String prevPageRequest = pageRequestModifier(allRequestParams, page - 1);
        model.addAttribute("nextPageRequest", nextPageRequest);
        model.addAttribute("prevPageRequest", prevPageRequest);
        model.addAttribute("resultPages", booksPages);
        return "search";
    }

    private static String pageRequestModifier(Map<String, String> allRequestParams, int page) {
        if (allRequestParams != null && !allRequestParams.isEmpty() && allRequestParams.containsKey("page")) {
            allRequestParams.put("page", Integer.toString(page));
            StringBuilder stringBuilder = new StringBuilder("?");
            for (Map.Entry<String, String> entry : allRequestParams.entrySet()) {
                stringBuilder.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            return stringBuilder.substring(0, stringBuilder.length() - 1);

        } else return "";
    }
}
