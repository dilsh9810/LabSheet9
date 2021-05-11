<%@ page import = "com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Details</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>
</head>
<body>
	<% 
		if(request.getParameter("itemCode") != null){
			
			Item item = new Item();
			String stsmsg = "";
			
			//Insert--------------------------------
			
			if(request.getParameter("hidItemIDSave") == ""){
				
				stsmsg = item.insertItem(request.getParameter("itemCode"),
							request.getParameter("itemName"),
							request.getParameter("itemPrice"),
							request.getParameter("itemDesc"));
					
				
				}
				
				else//Update----------------------------
				{
					stsmsg = item.updateItem(request.getParameter("hidItemIDSave"),
								request.getParameter("itemCode"),
								request.getParameter("itemName"),
								request.getParameter("itemPrice"),
								request.getParameter("itemDesc"));
							
							
				}
				
				session.setAttribute("statusMsg", stsmsg);
			
		}
	
//Delete----------------------------------------------------

if(request.getParameter("hidItemIDDelete") != null){
	
	Item item = new Item();
	
	String stsmsg = item.deleteItem(request.getParameter("hidItemIDDelete"));
	
	session.setAttribute("statusmsg", stsmsg);
	
	
	
}
	
	
	
%>
	<form id="formItem" name="formItem" method="post" action="items.jsp">
	
		<h1>Item Details</h1>
		
		<br>Item Code:
		<input id="itemCode" name="itemCode" type="text" class="form-control form-control-sm">
	
		<br>Item Name:
		<input id="itemName" name="itemName" type="text" class="form-control form-control-sm">
	
		<br>Item Price:
		<input id="itemPrice" name="itemPrice" type="text" class="form-control form-control-sm">
		
		<br>Item Description:
		<input id="itemDesc" name="itemDesc" type="text" class="form-control form-control-sm">
	
		<br>
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
		
		<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">

	</form>

</body>
</html>