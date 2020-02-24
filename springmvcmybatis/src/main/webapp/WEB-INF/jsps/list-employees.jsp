<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Employee List</h1>
	<button onclick="window.location.href='showFormForAddEmployee.html'" >Add</button>
	<div>
		<table border="1">
			<tr>
				<th>FullName</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Hobbies</th>
				<th>Country</th>
				<th>Address</th>
				<th></th>
			</tr>
			<c:forEach items="${listemployees}"  var="employee">
				<c:url var="deleteLink" value="/deleteEmployee">
					<c:param name="employeeId" value="${employee.id}"></c:param>
				</c:url>
				
				<c:url var="updateLink" value="/editEmployee">
					<c:param name="employeeId" value="${employee.id}"></c:param>
				</c:url>
				
				<tr>
					<td>${employee.fullname}</td>
					<td>${employee.email}</td>
					<td>${employee.gender}</td>
					<td>${employee.hobbies}</td>
					<td>${employee.country}</td>
					<td>${employee.address}</td>
					<td>
						<a href="${deleteLink}" onclick="if(!(confirm('Do you want to delete the record'))) return false;">Delete</a> |
					    <a href="${updateLink}">Edit</a>
					</td>
					
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>