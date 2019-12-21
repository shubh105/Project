<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page isELIgnored="false" %>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>

<html>

 <style>

body{
    background-image:url(https://static.pexels.com/photos/371633/pexels-photo-371633.jpeg);
    background-repeat:no-repeat;
    background-size: 100%;
}

footer{

	margin-top: 20px;
	padding-top: 20px;
}
.bg__card__navbar{
	background-color: #000000;
}
.bg__card__footer{
	background-color: #000000 !important;
}
#add__new__list{
    top: -38px;
    right: 0px;
}
</style>
    

<head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>


<body>

<main>
<div class="container my-5" id="show">
       <div class="card-body text-center">
    <h4 class="card-title">Subject Section</h4>
    
  </div>
    <div class="card">
        <button id="add__new__list" type="button" class="btn btn-success position-absolute" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Add a new List</button>
        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">Subject ID</th>
                <th scope="col">Subject Name</th>
                <th scope="col">Edit List </th>
                
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${subjectsList}" var="subjectObj">
			<tr>
			    <td>${subjectObj.subjectId}</td>
				<td>${subjectObj.subjectName}</td>
				<td><a class="btn btn-sm btn-primary" href=""><i class="far fa-edit"></i>Update</a>
				<a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/deleteUser/${subjectObj.subjectId}"><i class="fas fa-trash-alt"></i>Delete</a></td>
			</tr>
		</c:forEach>
            </tbody>
          </table>
    </div>
    <!-- Large modal -->


<div id="formmodal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" data-dismiss="modal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
          <div class="card-body text-center">
            <h4 class="card-title">Mention The Subject Details</h4>
          </div>
            <div class=" card col-8 offset-2 my-2 p-3">
          <form id="addsubjectform">
            <div class="form-group">
              <label for="subjectname">Subject Name</label>
              <input type="text" class="form-control" name="subjectName" id="subname" placeholder="Enter Subject Name">
            </div>
            <div class="form-group">
              <label for="datepicker">Deadline</label>
              <input  type="text" class="form-control" name="subjectId" id="subid" placeholder="Pick up a date">
            </div>
           <div class="form-group text-center">
             <button id="btnsubmit" type="submit" class="btn btn-block btn-primary" >Add</button>
             <button id="btnclose" type="submit" class="btn btn-block btn-primary" data-dismiss="modal" >close</button>
             
          </div>
        </form>
    </div>
    </div>
  </div>
</div>
</div>
</main>
</body>



 <script type="text/javascript">
 
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
						//alert("Saved Succesfully");
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

		});
     </script>
     
     <script type="text/javascript">
     $(document).ready(function(){
		$('#btnsubmit').click(function() {
			 $("table").empty();
			
			$.get(function(data, status){
			    
			    console.log(data.length);
			}
			    /* if(data.length!=0){
			    console.log('I m in if');
			    data.forEach(function(el, index) {
			    	console.log('Hello I m in for Each..');
			        console.log(el.employeeId+" "+el.employeeName);
			      
			        
			        var o = new Option(el.employeeName, el.employeeId);
		                 /// jquerify the DOM object 'o' so we can use the html method
		                 $(o).html(el.employeeName);
		                 $("#employee").append(o);
		                
		                 
			          */
			           });
			      });
			    </script>
     </html>