<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>
<table border="solid 1px #00080" bgcolor="lightgrey">
		<tr>
		    <th>Product ID</th>
			<th>Product Name</th>
			<th colspan="2">Options</th>
		</tr>
		<c:forEach items="${subjectsList}" var="subjectObj">
			<tr>
			    <td>${subjectObj.subjectId}</td>
				<td>${subjectObj.subjectName}</td>
				<td><a href="">Update</a></td>
				<td><a href="">Delete</a></td>
			</tr>
		</c:forEach>
		</table>
</div>
</body>
</html>