<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>


#add__new__list{
    top: -38px;
    right: 0px;
    margin-left:80%;
}

</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="card-body text-center">
    <h2 class="card-title">Subject Section</h2>
  </div>
<div class="card">
<button id="add__new__list" type="button" class="btn btn-success position-absolute" data-toggle="modal" data-target=".bd-example-modal-lg" ><i class="fas fa-plus"></i> Add new subject</button>
<table class="table table-hover" border="solid 1px">
 <thead>
		<tr>
		    <th>Subject ID</th>
			<th>Subject Name</th>
			<th colspan="2">Options</th>
		</tr>
		</thead>
		<c:forEach items="${subjectsList}" var="subjectObj">
		<tbody>
			<tr>
			    <td>${subjectObj.subjectId}</td>
				<td>${subjectObj.subjectName}</td>
				<td>
				<a class="btn btn-sm btn-primary" href="">Update</a>
				<a class="btn btn-sm btn-danger" href="">Delete</a></td>
			</tr>
			</tbody>
		</c:forEach>
		</table>
</div>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
          <div class="card-body text-center">
            <h4 class="card-title">Add New Subject</h4>
          </div>
            <div class=" card col-8 offset-2 my-2 p-3">
          <form id="addsubjectform">
            <div class="form-group" style="margin-left:30%">
              <label>Subject Name</label>
              <input type="text" class="form-control" name="subjectName" id="subname" placeholder="Enter Subject Name">
            </div>
            <div class="form-group" style="margin-left:30%">
              <label>Subject Id</label>
              <input type="text" class="form-control" name="subjectId" id="subid" placeholder="Enter Subject Id">
            </div>
            
           <div class="form-group text-center" style="width: 10%; margin-left:30%">
             <button id="btnsubmit" type="submit" class="btn btn-block btn-primary">Add</button>
          </div>
        </form>
    </div>
    </div>
  </div>
</div>
</body>

<script>

$(document).ready(function() {
    $('#addsubjectform').submit(function(event) {
           
        	event.preventDefault();
        	ajaxPost();
        });

	function ajaxPost() {

		// PREPARE FORM DATA
		var formData = {
			subjectName : $("#subname").val(),
			subjectId : $("#subid").val(),
		}

        	$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "addsubject",
				data : JSON.stringify(formData),
				dataType : 'json',
				success : function(result) {
					if (result.status == "success") {
						alert("Saved Succesfully");
					} else {
						alert("Error While Saving");
					}
					console.log(result);
				},
				error : function(e) {
					alert("Error!")
					console.log("ERROR: ", e);
				}
			});

		}

	})
        
</script>


</html>