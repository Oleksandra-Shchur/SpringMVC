<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All books</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>

<body>
<div id="header"><h1>CRUD (create, read, update, delete)</h1></div>

<div>

    <h2>All books </h2>

    <div>
        <form method="get" action="/search" target="_self" id="searchForm"/>
        <a href="${pageContext.request.contextPath}/addBook"><input type="button" value="Add new Book"></a>
        <a href="${pageContext.request.contextPath}/books"><input type="button" value="All books"></a>
        <input type="text" name="filerVal" placeholder="Type description here...">
        <input name="page" form="searchForm" hidden value="0"/>
        <input type='submit' value='Search'/>
        </form>
    </div>

    <c:if test="${!empty booksPages}">
    <table class="tg">
        <tr>
            <th class="tg-13pz tw1">id</th>
            <th class="tg-qsvf tw2">title</th>
            <th class="tg-qsvf tw3">description</th>
            <th class="tg-qsvf tw4">author</th>
            <th class="tg-qsvf tw5">isbn</th>
            <th class="tg-qsvf tw6">printYear</th>
            <th class="tg-qsvf tw7">readAlready</th>
            <th class="tg-qsvf tw8">Read</th>
            <th class="tg-qsvf tw9">Edit</th>
            <th class="tg-qsvf tw10">Remove</th>
        </tr>
        <c:forEach items="${booksPages.pageList}" var="book">
            <tr>
                <td class="tg-yw4l tw1">${book.id}</td>
                <td class="tg-yw4l tw2">${book.title}</td>
                <td class="tg-yw4l tw3">${book.description}</td>
                <td class="tg-yw4l tw4">${book.author}</td>
                <td class="tg-yw4l tw5">${book.isbn}</td>
                <td class="tg-yw4l tw6">${book.printYear}</td>
                <td class="tg-yw4l tw7">${book.readAlready}</td>
                <c:choose>
                    <c:when test="${book.readAlready==false}">
                        <td class="tg-yw4l tw8"><a href="/read=${book.id}">read</a></td>
                    </c:when>
                    <c:otherwise>
                        <td class="tg-yw4l tw8"><a>read</a></td>
                    </c:otherwise>
                </c:choose>
                <td class="tg-yw4l tw9"><a href="/edit=${book.id}">edit</a></td>
                <td class="tg-yw4l tw10"><a href="/remove=${book.id}">remove</a></td>
            </tr>
        </c:forEach>

        <tr>
            <td style="border-style:hidden"><a
                    <c:if test="${booksPages.firstPage}">hidden</c:if> href="/books${prevPageRequest}">Prev</a></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"><a
                    <c:if test="${booksPages.lastPage}">hidden</c:if> href="/books${nextPageRequest}">Next</a></td>
        </tr>
        </c:if>
        <c:if test="${empty booksPages}">
            List is EMPTY
        </c:if>

    </table>

</div>
</body>
</html>
