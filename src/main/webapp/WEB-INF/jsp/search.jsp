<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>

<body>
<div id="header"><h1>CRUD (create, read, update, delete)</h1></div>

<div>
    <h2>Searching results:</h2>

    <div>
        <form method="get" action="/search" target="_self" id="searchForm"/>
        <a href="${pageContext.request.contextPath}/addBook"><input type="button" value="Add new Book"></a>
        <a href="${pageContext.request.contextPath}/books"><input type="button" value="All books"></a>
        <input type="text" name="filerVal" placeholder="Type description here...">
        <input name="page" form="searchForm" hidden value="0"/>
        <input type='submit' value='Search'/>
        </form>
    </div>

    <c:if test="${!empty resultPages.pageList}">
    <table class="tg">
        <tr>
            <th class="tg-13pz tws1">id</th>
            <th class="tg-qsvf tws2">title</th>
            <th class="tg-qsvf tws3">description</th>
            <th class="tg-qsvf tws4">author</th>
            <th class="tg-qsvf tws5">isbn</th>
            <th class="tg-qsvf tws6">printYear</th>
        </tr>
        <c:forEach items="${resultPages.pageList}" var="book">
            <tr>
                <td class="tg-yw4l tws1">${book.id}</td>
                <td class="tg-yw4l tws2">${book.title}</td>
                <td class="tg-yw4l tws3">${book.description}</td>
                <td class="tg-yw4l tws4">${book.author}</td>
                <td class="tg-yw4l tws5">${book.isbn}</td>
                <td class="tg-yw4l tws6" >${book.printYear}</td>
            </tr>
        </c:forEach>

        <tr>
            <td style="border-style:hidden"><a
                    <c:if test="${resultPages.firstPage}">hidden</c:if> href="/search${prevPageRequest}">Prev</a></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"><a
                    <c:if test="${resultPages.lastPage}">hidden</c:if> href="/search${nextPageRequest}">Next</a></td>
        </tr>
        </c:if>
        <c:if test="${empty resultPages.pageList}">
            No matches.
        </c:if>

    </table>
</div>
</body>
</html>
