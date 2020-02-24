<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Add Employee</h1>
	<s:form modelAttribute="employee" action="saveProcess">
	
	<s:hidden path="id" />
			<s:hidden path="" value="${employee.hobbies}" id="hobbies" />
		Employee Name<s:input path="fullname"/><br/>
		Email<s:input path="email"/><br/>
		Gender <s:radiobutton path="gender" value="Male"/>Male<br/>
		<s:radiobutton path="gender" value="Female"/>Female<br/>
		Hobbies <s:checkbox path="hobbies" value="Sports"/>Sports<br/>
		<s:checkbox path="hobbies" value="Books"/>Books<br/>
		<s:checkbox path="hobbies" value="Swimming"/>Swimming<br/>
		<s:checkbox path="hobbies" value="Cycling"/>Cycling<br/>
		<s:checkbox path="hobbies" value="Singing"/>Singing<br/>
		
		Country <s:select path="country">
			<s:option value="India">INdia</s:option>
			<s:option value="SriLanka">SriLanka</s:option>
			<s:option value="Bangladesh">Bangladesh</s:option>
			<s:option value="Pakistan">Pakistan</s:option>
			<s:option value="UAE">UAE</s:option>
			<s:option value="US">US</s:option>
		</s:select><br/>
		
		<s:textarea path="address"/><br/>
		<input type="submit" value="Save" >
	</s:form>
	
	<script
		src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var hobbies = $("#hobbies").val().split(",");
			var $checkboxes = $("input[type=checkbox]");
			$checkboxes.each(function(idx, element) {
				if (hobbies.indexOf(element.value) != -1) {
					element.setAttribute("checked", "checked");
					$("#hobbies").val("");
				} else {
					element.removeAttribute("checked");
				}
			});
		});
	</script>
</body>
</html>