<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<f:form action="addquestion" method="post" modelAttribute="quesObj">

<f:select path="subjectObj" id="subject">
			<f:option value="0">----Select Subject--------</f:option>
			
 	 		<c:forEach items="${subjectList}" var="dOb">

 	 			<f:option value="${dOb.subjectId}"></f:option>

	 		</c:forEach>

		</f:select><br>

<f:input type="text" path="QuestionDesc" placeholder="Enter The Question"/>
<f:input type="text" path="optionA" placeholder="Option A"/>
<f:input type="text" path="optionB" placeholder="Option B"/>
<f:input type="text" path="optionC" placeholder="Option C"/>
<f:input type="text" path="optionD" placeholder="Option D"/>
<f:input type="text" path="correctAns" placeholder="Correct Answer"/>
<input type="submit" value="Add">

</f:form>

</body>
</html>