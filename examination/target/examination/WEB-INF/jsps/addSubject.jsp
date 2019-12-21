<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<style>

.contact-form {
    margin-top:70px;
}

</style>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div style="vertical-align: top; float: right">
<f:form action="addsubject" method="post" modelAttribute="addingSubject">

<p><i class="fa fa-address-book" style="font-size:24px"></i><f:input type="text" path="subjectName" placeholder="Enter Subject Name"/></p>
<p><i class="fa fa-pencil-square-o" style="font-size:24px"></i><f:input type="text" path="subjectId" placeholder="Enter Subject Id"/></p>
<p><input type="submit" value="Add" style="align-self: center"> 

</f:form>
</div>
</body>
</html>