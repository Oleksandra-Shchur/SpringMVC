<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit book</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
<div id="header"><h1>CRUD (create, read, update, delete)</h1></div>

<div>
    <h2>Edit book </h2>


    <c:url var="editAction" value="/update"/>

    <form:form id="editForm" action="${editAction}" modelAttribute="book" method="post">
        <table class="content-add">
            <c:if test="${!empty book.title}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="id"/>
                        </form:label>
                    </td>

                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="description">
                        <spring:message text="description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="author">
                        <spring:message text="author"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="author" readonly="true"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="isbn">
                        <spring:message text="isbn"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="isbn"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="printYear">
                        <spring:message text="printYear"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="readAlready">
                        <spring:message text="readAlready"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="readAlready" value="false" readonly="true"/>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="${pageContext.request.contextPath}/books"><input type="button" value="Back"></a>
                </td>
                <td colspan="2">
                    <input type=submit
                           value="<spring:message text="Save changes"/>"/>
                </td>
            </tr>
        </table>

    </form:form>
    <c:if test="${isInvalidArguments}">
        <p class="t-t2">Incorrect data. Please try again</p>
    </c:if>
</div>
</body>
</html>
